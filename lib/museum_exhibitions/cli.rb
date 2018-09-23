class MuseumExhibitions::CLI
  def call
    puts "Please select what you are interested in:"
    list_options
  end

  def list_options
  	puts "This will be a method that lists three options that I will extract w scraping: "
  	init_selection = gets.strip

  	case init_selection
  	when "1"
  	  puts "This will be a method that lists the 'Special Exhibitions' that I will extract w scraping: "
  	when "2"
  	  puts "This will be a method that lists the 'Free exhibitions and displays' that I will extract w scraping: "
  	when "3" 
  	  puts "This will be a method that lists the 'Today\'s events'  that I will extract w scraping: "
  	else 
  	  system("clear")
  	  puts "That was not a valid option."
  	  puts "Here are the options again:"
  	  puts "\n"
  	  list_options
  	end
  end
end