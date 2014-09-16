# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
    title "MyString"
    author "MyString"
    content "MyText"
    category "MyString"
  end
end
