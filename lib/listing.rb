class Listing
    # Listing belongs to Agent
    attr_reader :location, :id, :agent_id
    attr_accessor :status, :price, :agent

    def initialize(id = nil, status="for sale", location, price)
        @id = id
        @status = status
        @location = location
        @price = price
        @@all << self
    end

    def price_drop(percentage)
        self.price -= self.price*percentage
    end

    def self.all
        sql = <<-SQL
            SELECT *
            FROM listings
        SQL
        DB[:conn].execute(sql)
    end

    def self.create_table 
        sql = <<-SQL
          CREATE TABLE agents (
            id INTEGER PRIMARY KEY,
            location TEXT,
            price TEXT,
            status TEXT,
            agent_id INTEGER
          )
        SQL
        DB[:conn].execute(sql)
      end 

      def save 
        sql = <<-SQL     
          INSERT INTO songs (location, price, status, agent_id)       
          VALUES (?, ?, ?, ?)
        SQL
          DB[:conn].execute(sql, self.location, self.price, self.status, self.agent.id)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM listings")[0][0]
      end 
    
end
