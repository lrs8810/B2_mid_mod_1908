require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'when I visit the student index page' do
    it 'I see each student with their cohort and all of their instructors' do
      student_1 = create(:student, :with_instructors, instructor_count: 3)
      student_2 = create(:student, :with_instructors, cohort: '1910', instructor_count: 2)
      student_3 = create(:student, :with_instructors, cohort: '1906', instructor_count: 4)

      visit '/students'

      within "#student-#{student_1.id}" do
        expect(page).to have_content(student_1.name)
        expect(page).to have_content('Cohort: 1908')
        expect(student_1.instructors.count).to eq(3)
        expect(page).to have_content(student_1.instructors.pluck(:name).first)
      end

      within "#student-#{student_2.id}" do
        expect(page).to have_content(student_2.name)
        expect(page).to have_content('Cohort: 1910')
        expect(student_2.instructors.count).to eq(2)
        expect(page).to have_link(student_2.instructors.pluck(:name).first)
      end

      within "#student-#{student_3.id}" do
        expect(page).to have_content(student_3.name)
        expect(page).to have_content('Cohort: 1906')
        expect(student_3.instructors.count).to eq(4)
        expect(page).to have_link(student_3.instructors.pluck(:name).first)
      end
    end

    # it 'I see each instructors name as a link' do
    #   student_1 = create(:student, :with_instructors, instructor_count: 3)
    #   student_2 = create(:student, :with_instructors, cohort: '1910', instructor_count: 2)
    #   student_3 = create(:student, :with_instructors, cohort: '1906', instructor_count: 4)
    #
    #   visit '/students'
    #
    #   within "#student-#{student_1.id}" do
    #     expect(page).to have_content(student_1.instructors.pluck(:name).first)
    #   end
    #
    #   within "#student-#{student_2.id}" do
    #     expect(page).to have_link(student_2.instructors.pluck(:name).first)
    #   end
    #
    #   within "#student-#{student_3.id}" do
    #     expect(page).to have_content(student_3.name)
    #     expect(page).to have_content('Cohort: 1906')
    #     expect(student_3.instructors.count).to eq(4)
    #     expect(page).to have_link(student_3.instructors.pluck(:name).first)
    #   end
    end
  end
end
