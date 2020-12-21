class Project
    attr_accessor :title
    @@all = []
    
    def initialize(title)
        @title = title
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def add_backer(backer)
        project_backer = ProjectBacker.new(self, backer)
    end

    def backers
        my_backers = ProjectBacker.all.select {|project_details| project_details.project == self}
        my_backers.map {|project_backer| project_backer.backer}
    end   
end