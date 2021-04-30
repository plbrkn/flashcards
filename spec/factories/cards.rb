# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    original_text { 'some text' }
    translated_text { 'какой то текст' }
    review_date { Time.current }
  end
end
