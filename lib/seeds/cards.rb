# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

module Seeds
  # Cards
  class Cards
    DAYS = 3.days
    REVIEW_DATE = Time.current + DAYS 

    URL = 'https://1000mostcommonwords.com/1000-most-common-belarusian-words/'

    def call
      parse_page
      create_cards
    end

    private

    def parse_page
      @page = Nokogiri::HTML(URI.open(URL))
    end

    def create_cards
      @page.xpath('//html//body//main//article//div[1]//div//table//tbody//tr').drop(1).each do |tr|
        Card.create!(
          original_text: tr.at('td[3]').text,
          translated_text: tr.at('td[2]').text,
          review_date: REVIEW_DATE
        )
      rescue StandardError
        puts tr
      end
    end
  end
end
