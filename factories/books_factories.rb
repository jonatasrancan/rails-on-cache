FactoryBot.define do
  factory :book do
    title        { FFaker::Book.title }
    author       { FFaker::Book.author }
    description  { FFaker::Book.description }
  end
end
