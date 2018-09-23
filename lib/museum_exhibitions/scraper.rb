class Scraper

  def self.scrape_main_page(url)
  	doc = Nokogiri::HTML(open(url))

    all_titles = []

  	doc.css(".container .grid_12").each do |e|
      event_name = e.css("h2").text
      all_titles << event_name
    end

    selected_titles = [all_titles[1], all_titles[2], all_titles[3]]
    selected_titles  
  end 

end 