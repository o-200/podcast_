FactoryBot.define do
  factory :podcast do
    sequence (:name) { |n| "name #{n}"}
    text { Faker::Quotes::Chiquito.joke }
  end
end
