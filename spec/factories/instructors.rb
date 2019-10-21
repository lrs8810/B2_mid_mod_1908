FactoryBot.define do
  factory :instructor do
    sequence(:name) {|i| "Mike#{i}" }
  end

    trait :with_students do
      transient do
        student_count { 3 }
      end

    after(:create) do |instructor, evaluator|
      instructor.students << create_list(:student, evaluator.student_count)
    end
  end
end
