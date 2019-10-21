require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'on the instructor show page' do
    it 'I see that instructors name along with all their students and the students average age' do
      instructor = create(:instructor, :with_students, student_count: 3)

      visit "/instructors/#{instructor.id}"

      expect(page).to have_content(instructor.name)
      expect(instructor.students.count).to eq(3)
      expect(page).to have_content(instructor.students.pluck(:name).first)
      expect(page).to have_content('Average age of students: 25.0')
    end
  end
end
