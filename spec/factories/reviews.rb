FactoryBot.define do
  factory :review do
    title {Faker::Lorem.words(1)}
    content {Faker::Lorem.paragraphs}
    hastags {[Hastag.new(title: "hastag1"), Hastag.new(title: "hastag2"),
      Hastag.new(title: "hastag3")]}
    association :user
  end
end
