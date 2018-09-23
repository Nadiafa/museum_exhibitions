require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_main_page(page)
  	doc = Nokogiri::HTML(open(page))
    all_titles = []
  	doc.css(".container .grid_12").each do |e|
      event_name = e.css("h2").text
      all_titles << event_name
    end
    selected_titles = [all_titles[0], all_titles[1], all_titles[2]]
    selected_titles
    
  end 
end 