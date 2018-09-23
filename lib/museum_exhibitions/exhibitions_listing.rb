class MuseumExhibitions::ExhibitionsListing
  attr_accessor :name

  def self.first_listing 
  	puts "This will be a method that lists three options that I will extract w scraping: "
  	option1 = self.new
  	option1.name = "Special Exhibitions"
  	option2 = self.new
  	option2.name = "Free exhibitions and displays"
  	option3 = self.new
  	option3.name = "Today's events"
  	[option1, option2, option3]
  end
end 