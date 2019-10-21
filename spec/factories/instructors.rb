FactoryBot.define do
  factory :instructor do
    sequence(:name) {|i| "Mike#{i}" }
  end
end
