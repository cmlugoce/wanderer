



module Wanderer

  class Wander

    attr_accessor :name, :location, :description, :distance, :url

    @@all = []

    def initialize
      @@all << self
    end

    def self.all
      @@all
    end


         end
       end
