FactoryBot.define do
  factory :podcast do
    sequence (:name) { |n| "name #{n}"}
    body { Faker::Quotes::Chiquito.joke }
  end
end
