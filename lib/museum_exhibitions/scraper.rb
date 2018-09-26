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

  def self.scrape_secondary_menu(url, specific_selector, name_selector)
     doc = Nokogiri::HTML(open(url))

     events = []

     doc.css(specific_selector).each do |e|
       event_name = e.css(name_selector).text
       @event_url = e.search("a").first.attr("href")
       url_corrections
       events << {event_name: event_name, event_url: @event_url}
     end 
     events
   end 

  def self.url_corrections
    if !@event_url.include? "http://www.britishmuseum.org"
      @event_url = "http://www.britishmuseum.org#{@event_url}"
    end
    if @event_url.include? "?"
      @event_url = @event_url.split('?')[0]
    end
  end

end 
