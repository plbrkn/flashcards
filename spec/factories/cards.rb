# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    original_text { 'some text' }
    translated_text { 'какой то текст' }

    trait :invalid_card do
      original_text { 'some text' }
      translated_text { 'some text' }
    end

    trait :random_card do
      original_text { 'some text' }
      translated_text { 'какой то текст' }
      review_date { Time.current - 3.days }
    end
  end
end
