require "pry"

class Pizza
    @@all = []

    attr_accessor :name, :ingredients, :desc

    def initialize(attributes)
        attributes.each do |key, value|
            self.send("#{key}=", value)
        end
        # self.name = name
        # self.ingredients = ingredients
        # self.desc = desc
        save
    end 

    def save
        @@all << self
    end

    def print_attributes
        puts self.name
        puts self.ingredients
        puts self.desc
    end 

    def self.all
        @@all
    end

    def self.find(name)
       self.all.find do |pizza|
            pizza.name == name
        end
    end
end

pepperoni = Pizza.new(name: "Pepperoni", ingredients: "cheese, pepperoni", desc: "delicious")
hawaiian = Pizza.new(name: "Hawaiian", ingredients: "cheese, pineapple, ham", desc: "cool")

binding.pry
