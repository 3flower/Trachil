FactoryBot.define do
  factory :travel_image do
    image_url     {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/default.png'))}
  end
end
