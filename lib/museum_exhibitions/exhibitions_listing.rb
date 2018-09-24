class ExhibitionsListing
  attr_accessor :name

  def self.menu1_listing
    selected_titles = Scraper.scrape_main_menu(Constants::URL)
    selected_titles.each_with_index do |e, i|
      puts "  #{i+1}. #{e}."
    end     
  end

  def self.menu2_specials
  	exhibitions = Scraper.scrape_special_menu(Constants::URL)
  	exhibitions.each_with_index do |e,i|
  		puts "\n"
  		puts "#{i+1}. '#{e[:event_name]}' - #{e[:event_date]}."
  		puts "  Follow this link to learn more:  "
  		puts "  '#{e[:event_url]}' "
  		puts "\n"
  	end
  end


  #TODO   NEXT: Remove the additional input "Free" from some of the returned exhibitions.
  		# THEN: add listing for Today's Events, and change CLI input wording.
end 