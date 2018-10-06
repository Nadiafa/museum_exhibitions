class Event
  attr_accessor :category, :name, :url

  @@all = []

  def initialize(event_hash)
    event_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_listing(events)
    events.each do |event|
      Event.new(event)
    end
  end

  def self.all
    @@all
  end

  def self.all_by_category(category)
  	@@all.select {|event| event.category == category }
  end	
end
