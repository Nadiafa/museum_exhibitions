class CLI
  def landing
  	welcome
    menu1
    menu2
    start_again
  end

  def welcome
    system("clear")
    puts Constants::WELCOME_MESSAGE
  end 

  def menu1
  	ExhibitionsListing.menu1_listing
  end

  def menu2
    puts "\n"
    puts Constants::LEARN_MORE_MESSAGE

  	input = gets.strip.downcase

  	case input 
  	when "1"
      system("clear")
      puts Constants::SPECIAL_MESSAGE
      ExhibitionsListing.menu2_specials
  	when "2"
      system("clear")
      puts Constants::FREE_MESSAGE
      ExhibitionsListing.menu2_free
  	when "3" 
      system("clear")
      puts Constants::TODAY_MESSAGE
      ExhibitionsListing.menu2_today
    when "exit"
      exit_program
  	else 
  	  system("clear")
      puts Constants::INVALID_INPUT_MESSAGE
      puts Constants::SELECT_AGAIN_MESSAGE
  	  puts "\n"
      menu1
  	  menu2
  	end  
  end

  def start_again
    puts "\n"
    puts Constants::START_AGAIN_MESSAGE

    input = gets.strip.downcase

      if input == "yes" || input == "y"
        landing
      elsif input == "no" || input == "n" || input == "exit"
        exit_program
      else
        puts Constants::INVALID_INPUT_MESSAGE
        start_again
      end
  end

  def exit_program
    puts Constants::EXIT_MESSAGE

    gets
    exit!
  end

end