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
        ProjectBacker.all.select {|backer| backer.project == self}
    end

    def backers
        

        #1. Goal: we want the "backers" method to return an array of backers associated with this Project instance.
        #2. but before that, we need to first build another method ("project_backer method") to access
            #inside the @@all array for "ProjectBackers" class since they are our gatekeeper to access backer data
        #3. and how do we usually go through a list of data?  enumerate.
        #4. Now to start, we write 'ProjectBacker.all' because we want to invoke the .all class method 
            #to access the @@all array in the ProjectBacker class that contains 
            #an array mixed in with Project class and Backer class info. We ideally JUST want the
            #backer data that happens to be connected with this Project instance("self"). BUT, we cannot do that yet
            # because we must first select the correct ProjectBacker element.
            #for example, the line "ProjectBacker.all.select {|backer| backer.project == self}" returns this array:
        
            #ARRAY 1 
            
                #[#<ProjectBacker:0x00007ff2eca3c780 @project=#<Project:0x00007ff2eca3c848 @title="Karaoke">, 
                #@backer=...f2eca3c938 @title="Ruby, Ruby, and More Ruby">, 
                #@backer=#<Backer:0x00007ff2eca3c7a8 @name="Meryl">>]
           
            #notice how ARRAY 1 contains ProjectBacker data, then @project data, then @backer data?
                #we do not want all of that, we JUST want @project data which also includes the @title.  
                #Our end goal is to return an array that looks like this:

            #ARRAY 2 
              
              ##[<Project:0x00007fd2528f1278 @title="Karaoke">, 
              #@project=#<Project:0x00007fd2528f12f0 @title="Ruby, Ruby, and More Ruby">>]

            # we want ARRAY 2 because that is the final result, be we cannot get ARRAY 2 because we 
            #must first go through our gatekeeper, ProjectBacker class, to access any of the Backer class data.

            #to do this, we must write the line "ProjectBacker.all.select {|backer| backer.project == self}" to first get 
            #access to the ProjectBacker array list that contains the related information, but just so happens to be mixed 
            #with a bunch of other things that we do not want (refer to ARRAY 1). 
       

            project_backer.map { |mixed_data| mixed_data.backer}
            #So, now that we have gotten past our gatekeeper, ProjectBacker, by implementing "ProjectBacker.all.select {|backer| backer.project == self}"
                #and giving us access to the mixed data, it is now time to create another enumerator to go through
                #this mixed bag of data, and ONLY return the data we want (aka Project data...aka ARRAY 2).
            #5. To start, we want to create an enumerator to go through what we have in ARRAY 1, and return only the Project class data.
                #lets use "project_backer.map {|mixed_data| mixed_data.backer}" 
    
        end 
    
    
    
    
    

end 