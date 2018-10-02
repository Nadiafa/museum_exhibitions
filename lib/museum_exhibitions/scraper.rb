class Scraper

  def self.scrape_main_menu(url)
    doc = Nokogiri::HTML(open(url))

    all_titles = []

    doc.css(".container .grid_12").each do |e|
      name = e.css("h2").text
      all_titles << name
    end
    selected_titles = [all_titles[1], all_titles[2], all_titles[3]]
    selected_titles  
  end 


  def self.scrape_secondary_menu(url, specific_selector, name_selector,category)
     doc = Nokogiri::HTML(open(url))

     events = []

     doc.css(specific_selector).each do |e|
       name = e.css(name_selector).text
       @url = e.search("a").first.attr("href")
       url_corrections
       events << {name: name, url: @url, category: category}
     end 
     events
   end 

  def self.url_corrections
    if !@url.include? "http://www.britishmuseum.org"
      @url = "http://www.britishmuseum.org#{@event_url}"
    end
    if @url.include? "?"
      @url = @url.split('?')[0]
    end
  end

end 
