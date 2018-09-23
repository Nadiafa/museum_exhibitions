class CLI
  def landing
  	welcome
    list_options
    menu
  end

  def welcome
    system("clear")
    puts "This application will show the current exhibitions at the British Museum."
  end 

  def list_options
  	ExhibitionsListing.first_listing
  end



# TODO 



  def menu 
    puts "\n"
    puts "Select the number of the list you would like to learn more about."
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



# SELECTORS
# Special Exhibitions
#   .grid_4
#       Nombre
#         p 
#       Dates
#         .pullOut

# Free exhibitions and displays
#   .grid_4
#     Nombre
#       h3
#     Dates
#       .pullOut 

# Today's events
#   .grid_12
#     Nombre
#       .grid_6
#     Time
#       .grid_2 p


