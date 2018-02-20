FactoryBot.define do
  factory :comment do
    author  { FFaker::Book.author }
    body    { FFaker::Lorem.paragraph }
    rate    { rand(1..10) }
    book    { FactoryBot.create(:book) }
  end
end
