require 'rails_helper'

RSpec.describe Student do
  describe 'attributes' do
    it 'has a name, cohort number, and age' do
      student = build(:student)

      expect(student).to respond_to(:name)
      expect(student.cohort).to eq('1908')
      expect(student).to respond_to(:age)
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should have_many :instructor_students }
    it { should have_many(:instructors).through(:instructor_students) }
  end
end
