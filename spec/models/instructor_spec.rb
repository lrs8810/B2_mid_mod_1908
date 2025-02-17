require 'rails_helper'

RSpec.describe Instructor do
  describe 'attributes' do
    it 'has a name' do
      instructor = build(:instructor)

      expect(instructor).to respond_to(:name)
    end
  end

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :instructor_students }
    it { should have_many(:students).through(:instructor_students) }
  end
end
