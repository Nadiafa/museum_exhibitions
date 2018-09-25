class Scraper

  def self.scrape_main_menu(url)
    doc = Nokogiri::HTML(open(url))

    all_titles = []

    doc.css(".container .grid_12").each do |e|
      event_name = e.css("h2").text
      all_titles << event_name
    end
    selected_titles = [all_titles[1], all_titles[2], all_titles[3]]
    selected_titles  
  end 

  def self.scrape_special_menu(url)
    doc = Nokogiri::HTML(open(url))
    
    special_exhibitions = []
 
    doc.css(".container .grid_12 .grid_12 .grid_4").each do |e|
      event_name = e.css("h3 a").text
      @event_url = e.search("a").first.attr("href")
      url_corrections
      special_exhibitions << {event_name: event_name, event_url: @event_url}
    end 
    special_exhibitions
  end 

  def self.scrape_free_menu(url)
    doc = Nokogiri::HTML(open(url))
    
    free_exhibitions = []

    doc.css(".container .grid_12 .grid_4 .titleSpacer").each do |e|
      event_name = e.css("h3").text
      @event_url = e.search("a").first.attr("href")
      url_corrections
    free_exhibitions << {event_name: event_name, event_url: @event_url}
    end 
    free_exhibitions
  end

  def self.scrape_today_menu(url)
    doc = Nokogiri::HTML(open(url))
    
    today_events = []

    doc.css(".container .grid_12 ul li").each do |e|
      event_name = e.css("a .grid_6").text
      @event_url = e.search("a").first.attr("href")
      url_corrections
      today_events << {event_name: event_name, event_url: @event_url}
    end 
    today_events
  end 

  def self.url_corrections
    if !@event_url.include? "http://www.britishmuseum.org"
      @event_url = "http://www.britishmuseum.org#{@event_url}"
    end
    if @event_url.include? " exclusive"
      @event_url = @event_url.split(' exclusive')[0]
    end
  end

end 
