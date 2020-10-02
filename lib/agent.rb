class Agent
    # Agent has many Listings
    attr_reader :name, :id
    attr_accessor :telephone, :yrs_experience
  
    def initialize(name, telephone, yrs_experience, id = nil)
      @name = name 
      @telephone = telephone 
      @yrs_experience = yrs_experience
      @id = id
    end   
  
    def listings 
      Listing.all.select {|listing| listing.agent == self}
    end   
    
    def add_listing(location, price, status)
      new_listing = Listing.new(location, price, status)
      new_listing.agent = self
    end   

    def self.create_table 
      sql = <<-SQL
        CREATE TABLE agents (
          id INTEGER PRIMARY KEY,
          name TEXT,
          telephone TEXT,
          yrs_experience INTEGER
        )
      SQL
      DB[:conn].execute(sql)
    end 

    def save 
      sql = <<-SQL     
        INSERT INTO songs (name, telephone, yrs_experience)       
        VALUES (?, ?, ?)
      SQL
        DB[:conn].execute(sql, self.telephone, self.yrs_experience)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM agents")[0][0]
    end 
    
  end  
