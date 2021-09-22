require "pry"

class Starship 
    @@all = [] # this class variable stores all new instances of class

    attr_accessor :name, :model

    # def initialize(name:, model:) # using keyword arguments
    #     @name = name
    #     @model = model
    #     save # calling save method below
    # end 

    def initialize(attributes) # has of name, model key/value pairs
        attributes.each do |key, value| # uses mass assignment to dynamically set object attributes
            self.send("#{key}=", value)
        end
        save
    end

    def save
        @@all << self #dynamically add the new instance to array
    end

    def self.all # class method (uses self in method name)
        @@all
    end

    def print_name # instance method (self is inside method)
        puts self.name
    end

    def self.find(name)
        self.all.find do |starship|
            starship.name == name
        end
    end

end 

icelanding = Starship.new(model: "falcon", name: "icelanding")
luna_pearl = Starship.new(name: "luna_pearl", model: "falcon")

binding.pry
