FactoryBot.define do
  factory :student do
    sequence(:name) { |i| "Laura#{i}" }
    cohort { '1908' }
    sequence(:age, 22) { |i| i+2 }
  end

    trait :with_instructors do
      transient do
        instructor_count { 3 }
      end

    after(:create) do |student, evaluator|
      student.instructors << create_list(:instructor, evaluator.instructor_count)
    end
  end
end
