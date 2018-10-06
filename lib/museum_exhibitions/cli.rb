class CLI

  def start
    menu1
    menu2
    start_again
  end 

  def menu1
    clear_screen
    puts "These are the British Museum's main exhibition sections:"
    
    if @titles == nil
      @titles = Scraper.scrape_main_menu("http://www.britishmuseum.org/whats_on.aspx")
    end

    print_titles
  end 

  def menu2
    puts "\n"
    puts "\nSelect the number of the list you would like to learn more about."
  	input = gets.strip.downcase
    clear_screen

  	case input 
    when "1"
      puts "These are the current 'Special Exhibitions':"

      if Event.all_by_category(Scraper.categories[0]) == []
        @events = Event.create_listing(Scraper.scrape_secondary_menu("http://www.britishmuseum.org/whats_on.aspx", ".grid_12 .grid_12 .grid_4", "h3 a", Scraper.categories[0])) 
      end

      print_events(Event.all_by_category(Scraper.categories[0]))
  	
    when "2"
      puts "These are the current 'Free exhibitions and displays':"

      if Event.all_by_category(Scraper.categories[1]) == []
        @events = Event.create_listing(Scraper.scrape_secondary_menu("http://www.britishmuseum.org/whats_on.aspx", ".container .grid_12 .grid_4 .titleSpacer", "h3 a", Scraper.categories[1]))
      end

      print_events(Event.all_by_category(Scraper.categories[1]))
  	
    when "3" 
      puts "These are 'Today\'s events':"

      if Event.all_by_category(Scraper.categories[2]) == []
      @events = Event.create_listing(Scraper.scrape_secondary_menu("http://www.britishmuseum.org/whats_on.aspx", ".container .grid_12 ul li", "a .grid_6", Scraper.categories[2])) 
    end

      print_events(Event.all_by_category(Scraper.categories[2]))    
    
    when "exit"
      exit_program
  	
    else 
      clear_screen
      puts "\nThat was not a valid option."
      start_again
  	  start
  	end  
  end

  def start_again
    puts "Would you like to start again? (Y/n)"
    input = gets.strip.downcase

    if input == "yes" || input == "y"
      start
    elsif input == "no" || input == "n" || input == "exit"
      exit_program
    else
      puts "\nThat was not a valid option."
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
    puts "\nGoodbye!"
    exit!
  end

  def clear_screen
    system("clear")
  end 

end