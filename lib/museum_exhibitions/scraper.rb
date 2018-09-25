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
 
    doc.css(".grid_12 .grid_12 .grid_4").each do |e|
      event_name = e.css("h3 a").text
      event_date = e.css(".pullOut").text
      event_url = e.search("a").first.attr("href")
      special_exhibitions << {event_name: event_name, event_date: event_date, event_url: event_url}
    end 
    special_exhibitions
  end 

end 




# SELECTORS
# Special Exhibitions
#   .grid_4
#       Nombre
#         .h3 a (text)
#       Dates
#         .pullOut (text)

# Free exhibitions and displays
#   .grid_4
#     Nombre
#       .h3 a (text)
#     Dates
#       .pullOut (text)

# Today's events
#   .grid_12
#     Nombre
#       .grid_6 (text)
#     Time
#       .grid_2 p (text)