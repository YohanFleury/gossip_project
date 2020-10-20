require 'csv'

class Gossip
    attr_accessor :author, :content
    def save
        CSV.open("/Users/yohanfleury/Desktop/THP_general/the_gossip_project_sinatra/db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end
    end
    def initialize(author, content)
        @author = author
        @content = content        
    end
    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end
      def self.find(id)
        new_array = []
        CSV.read("./db/gossip.csv").each_with_index do |row, index|
          if (id == index+1)
            new_array << Gossip.new(row[0], row[1])
          end
        end
        return new_array
      end

end

