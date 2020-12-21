class Backer
    attr_accessor :name
    @@all = []
    
    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    def back_project(project)
        project_backer = ProjectBacker.new(project, self)
    end

    def backed_projects
        my_projects = ProjectBacker.all.select {|project_details| project_details.backer == self}
        my_projects.map {|project_backer| project_backer.project}
    end
end