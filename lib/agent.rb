class Agent
    # Agent has many Listings
    attr_reader :name
    attr_accessor :telephone, :yrs_experience
  
    def initialize(name, telephone, yrs_experience)
      @name = name 
      @telephone = telephone 
      @yrs_experience = yrs_experience
    end   
  
    def listings 
      Listing.all.select {|listing| listing.agent == self}
    end   
    
    def add_listing(location, price, status)
      new_listing = Listing.new(location, price, status)
      new_listing.agent = self
    end   
    
  end  
