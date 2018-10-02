class ExhibitionsListing

  def self.first_level
    Scraper.scrape_main_menu(Constants::URL)
  end

  def self.second_level
    Event.create_from_collection(Scraper.scrape_secondary_menu(Constants::URL, Constants::SPECIFIC_SELECTOR_SPECIAL, Constants::NAME_SELECTOR_SPECIAL,"cat1"))
    Event.create_from_collection(Scraper.scrape_secondary_menu(Constants::URL, Constants::SPECIFIC_SELECTOR_FREE, Constants::NAME_SELECTOR_FREE,"cat2"))
    Event.create_from_collection(Scraper.scrape_secondary_menu(Constants::URL, Constants::SPECIFIC_SELECTOR_TODAY, Constants::NAME_SELECTOR_TODAY,"cat3"))
    Event.all
  end




  # def self.menu2_iterations
  #   @exhibitions.each_with_index do |e,i|
  #     puts "\n"
  #     puts "#{i+1}. '#{e[:event_name]}'"
  #     puts "  Follow this link to learn more: '#{e[:event_url]}'"
  #   end
  # end

end 
