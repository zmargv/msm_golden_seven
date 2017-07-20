# Copy this file into your spec/support folder; create one if you don't have it.
# https://github.com/firstdraft/increasing_random/blob/master/increasing_random.rb

require Rails.root.join("spec", "support", "increasing_random.rb")

FactoryGirl.define do
  factory :director do
    sequence(:id, IncreasingRandom.new) { |n| n.value }
    sequence(:name, IncreasingRandom.new) { |n| "Some fake name #{n}" }
    sequence(:bio, IncreasingRandom.new) { |n| "Some fake bio #{n}" }
    sequence(:dob, IncreasingRandom.new) { |n| "Some fake dob #{n}" }
    sequence(:image_url, IncreasingRandom.new) { |n| "Some fake image url #{n}" }
  end
end
