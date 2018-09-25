class CLI
  def landing
  	welcome
    menu1
    menu2
    start_again
  end

  def welcome
    system("clear")
    puts "These are the British Museum's main exhibition sections:"
  end 

  def menu1
  	ExhibitionsListing.menu1_listing
  end

  def menu2
    puts "\n"
    puts "Select the number of the list you would like to learn more about, or type 'exit' to leave."
  	input = gets.strip.downcase

  	case input 
  	when "1"
      system("clear")
  	  puts "These are the current 'Special Exhibitions':"
      ExhibitionsListing.menu2_specials
  	when "2"
  	  puts "These are the current 'Free exhibitions and displays':"
      ExhibitionsListing.menu2_free
  	when "3" 
  	  puts "These are 'Today\'s events':"
      ExhibitionsListing.menu2_today
    when "exit"
      exit_program
  	else 
  	  system("clear")
  	  puts "That was not a valid option. Here are the options again:"
  	  puts "\n"
  	  menu1
  	end  
  end

  def start_again
    puts "\n"
    puts "Would you like to start again? (Y/n)"
    input = gets.strip.downcase

      if input == "yes" || input == "y"
        landing
      elsif input == "no" || input == "n" || input == "exit"
        exit_program
      else
        puts "That was not a valid option."
        start_again
      end
  end

  def exit_program
    puts "Goodbye!"
    gets
    exit!
  end

end



