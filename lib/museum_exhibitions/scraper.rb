class Scraper

  @@categories = []

  def self.scrape_main_menu(url)
    doc = Nokogiri::HTML(open(url))

    @@categories = doc.css(".container .grid_12").map do |e|
      name = e.css("h2").text
    end
    
    @@categories = [@@categories[1], @@categories[2], @@categories[3]]
  end 

  def self.categories
    @@categories
  end


  def self.scrape_secondary_menu(url, specific_selector, name_selector,category)
     doc = Nokogiri::HTML(open(url))

     events = []

     doc.css(specific_selector).each do |e|
       name = e.css(name_selector).text
       @url = e.search("a").first.attr("href")
       category = category
       url_corrections
       events << {category: category, name: name, url: @url}
     end 

     events
   end 

  def self.url_corrections
    if !@url.include? "http://www.britishmuseum.org"
      @url = "http://www.britishmuseum.org#{@url}"
    end
    if @url.include? "?"
      @url = @url.split('?')[0]
    end
  end
end 
