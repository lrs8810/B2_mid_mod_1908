require 'rails_helper'

RSpec.describe Student do
  describe 'attributes' do
    it 'has a name, cohort number, and age' do
      student = build(:student)

      expect(student.name).to eq('Laura')
      expect(student.cohort_num).to eq('1908')
      expect(student.age).to eq(31)
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :cohort_num }
    it { should validate_presence_of :age }
  end

  describe 'relationships' do
    it { should have_many :instructor_students }
    it { should have_many(:instructors).through(:instructor_students) }
  end
end
