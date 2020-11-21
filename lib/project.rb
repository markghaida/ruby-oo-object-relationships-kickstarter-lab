require 'pry'
class Project 
    
    attr_reader :title
    @@all = []

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end


    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end
      
    
    def project_backer 
        # binding.pry
        ProjectBacker.all.select {|backer| backer == self}

        #that returns all backers associated with this Project instance.
        #[#<Backer:0x00007fd84a0db568 @name="Steven">, 
            #<Backer:0x00007fd84a0db518 @name="Meryl">]
    end

    def projects

    end 
    
#[#<Project:0x00007fd84721c2b8 @title="Karaoke">, 
#<Project:0x00007fd84721c510 @title="Ruby, Ruby, and More Ruby">]

end 