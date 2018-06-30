require 'open-uri'
require 'nokogiri'
require 'pry'

module Wanderer

  class Wander

attr_accessor :name, :caption

def self.get_page

  doc = Nokogiri::HTML(open("https://www.fodors.com/news/photos/fodors-go-list-2018"))
     destinations = doc.css('div.container')
     destinations.collect do |destination, i|

           place = self.new
           place.name = destination.css('h2').text.strip

           place.caption = destination.css('p').text.gsub("\n", "")

            place
        end

  end


  end#of class


end #of module
