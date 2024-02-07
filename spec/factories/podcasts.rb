FactoryBot.define do
  factory :podcast do
    sequence (:name) { |n| "name #{n}"}
    body { Faker::Quotes::Chiquito.joke }
    audio { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'testfiles', 'testfile.mp3'), 'audio/mpeg') }
  end
end
