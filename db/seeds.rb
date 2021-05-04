# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

DAYS = 3.days
REVIEW_DATE = Time.current + DAYS

URL = 'https://1000mostcommonwords.com/1000-most-common-belarusian-words/'

HTMLDOC = Nokogiri::HTML(URI.open(URL))

HTMLDOC.xpath('//html//body//main//article//div[1]//div//table//tbody//tr').drop(1).each do |tr|
  Card.create!(
    original_text: tr.at('td[3]').text,
    translated_text: tr.at('td[2]').text,
    review_date: REVIEW_DATE
  )
rescue StandardError
  puts tr
end
