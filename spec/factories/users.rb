FactoryBot.define do
  factory :user do
    email { 'example@email.com' }
    password { 'MyString' }
    password_confirmation { 'MyString' }
  end
end
