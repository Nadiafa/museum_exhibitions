class CLI
  def landing
  	welcome
    menu1
    menu2
  end

  def welcome
    system("clear")
    puts "These are the British Museum's main exhibition sections:"
  end 

  def menu1
  	ExhibitionsListing.menu1_listing
  end



# TODO 

  def menu2
    puts "\n"
    puts "Select the number of the list you would like to learn more about."
  	input = gets.strip

  	case input 
  	when "1"
      system("clear")
  	  puts "These are the current 'Special Exhibitions':"
      ExhibitionsListing.menu2_specials
  	when "2"
  	  puts "This will be a method that lists the 'Free exhibitions and displays' that I will extract w scraping: "
      ExhibitionsListing.menu2_free
  	when "3" 
  	  puts "This will be a method that lists the 'Today\'s events'  that I will extract w scraping: "
  	else 
  	  system("clear")
  	  puts "That was not a valid option."
  	  puts "Here are the options again:"
  	  puts "\n"
  	  menu1
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


