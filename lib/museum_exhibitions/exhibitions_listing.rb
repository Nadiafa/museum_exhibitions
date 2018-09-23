class ExhibitionsListing
  attr_accessor :name

  def self.first_listing
    selected_titles = Scraper.scrape_main_page(Constants::URL)
    selected_titles.each_with_index do |e, i|
      puts "  #{i+1}. #{e}."
    end     
  end
end 