class ExhibitionsListing

  def self.menu1_listing
    selected_titles = Scraper.scrape_main_menu(Constants::URL)
    selected_titles.each_with_index do |e, i|
      puts "  #{i+1}. #{e}."
    end     
  end

  def self.menu2_specials
    @exhibitions  = Scraper.scrape_secondary_menu(Constants::URL, Constants::SPECIFIC_SELECTOR_SPECIAL, Constants::NAME_SELECTOR_SPECIAL)
  	# @exhibitions = Scraper.scrape_special_menu(Constants::URL)
    menu2_iterations
  end

  def self.menu2_free
    @exhibitions  = Scraper.scrape_secondary_menu(Constants::URL, Constants::SPECIFIC_SELECTOR_FREE, Constants::NAME_SELECTOR_FREE)
  	# @exhibitions = Scraper.scrape_free_menu(Constants::URL)
    menu2_iterations
  end 

  def self.menu2_today
    @exhibitions  = Scraper.scrape_secondary_menu(Constants::URL, Constants::SPECIFIC_SELECTOR_TODAY, Constants::NAME_SELECTOR_TODAY)
	  # @exhibitions = Scraper.scrape_today_menu(Constants::URL)
    menu2_iterations
  end

  def self.menu2_iterations
    @exhibitions.each_with_index do |e,i|
      puts "\n"
      puts "#{i+1}. '#{e[:event_name]}'"
      puts "  Follow this link to learn more: '#{e[:event_url]}'"
    end
  end
  
end 
