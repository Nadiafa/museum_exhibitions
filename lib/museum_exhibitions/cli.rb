class CLI

  def landing
    clear_screen
    puts Constants::WELCOME_MESSAGE

    @titles = ExhibitionsListing.main_menu
    @events = ExhibitionsListing.events_list

    print_titles

    menu2

    start_again
  end

  def menu2
    puts "\n"
    puts Constants::LEARN_MORE_MESSAGE
  	input = gets.strip.downcase
    clear_screen

  	case input 
  	when "1"
      puts Constants::MESSAGE_CAT1
      print_events(Event.all_by_category("cat1"))
  	when "2"
      puts Constants::MESSAGE_CAT2
      print_events(Event.all_by_category("cat2"))
  	when "3" 
      puts Constants::MESSAGE_CAT3
      print_events(Event.all_by_category("cat3"))    
    when "exit"
      exit_program
  	else 
      puts Constants::INVALID_INPUT_MESSAGE
      start_again
  	  landing
  	end  
  end

  def start_again
    puts Constants::START_AGAIN_MESSAGE
    input = gets.strip.downcase

    if input == "yes" || input == "y"
      Event.clear
      landing
    elsif input == "no" || input == "n" || input == "exit"
      exit_program
    else
      puts Constants::INVALID_INPUT_MESSAGE
      start_again
    end
  end

  def print_titles
    @titles.each_with_index do |e, i|
      puts "  #{i+1}. #{e}."
    end     
  end 

  def print_events(events)
    events.each_with_index do |event, i| 
      puts "  - #{event.name}"
      puts "    Find out more here:  #{event.url}"        
    end
  end 

  def exit_program
    puts Constants::EXIT_MESSAGE
    gets
    exit!
  end

  def clear_screen
    system("clear")
  end 

end