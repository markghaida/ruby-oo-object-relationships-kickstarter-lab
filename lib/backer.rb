require 'pry'

class Backer 
    attr_accessor :name, :title
    @@all = []
    def initialize(name)
        @name = name
        @@all << self 
    end 

    def self.all
        @@all
    end

    
    def back_project(project)
        ProjectBacker.new(project, self)
        #binding.pry
    end

    def before_backed_projects
        
        ProjectBacker.all.select do |project| 
            project.backer == self
            #binding.pry 
        end 
    #[#<ProjectBacker:0x00007ff2eca3c780 @project=#<Project:0x00007ff2eca3c848 @title="Karaoke">, 
    #@backer=...f2eca3c938 @title="Ruby, Ruby, and More Ruby">, 
    #@backer=#<Backer:0x00007ff2eca3c7a8 @name="Meryl">>]
    end 


    def backed_projects 
        before_backed_projects.map do |project_backer|
            project_backer.project
            #binding.pry
        end 
         #returns an array of projects associated with this Backer instance
#[#<Project:0x00007fce49867e18 @title="Karaoke">, 
#<Project:0x00007fce49867f80 @title="Ruby, Ruby, and More Ruby">]
    end  
    
end 