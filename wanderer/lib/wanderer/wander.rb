
require 'open-uri'
require 'nokogiri'
require 'pry'


module Wanderer

  class Wander

    attr_accessor :name, :location, :description


      def self.get_page

           doc = Nokogiri::HTML(open("https://www.fodors.com/news/photos/14-of-the-most-beautiful-seashores-in-americas-national-parks"))

           trips = doc.css(".container.slides")
           trips.collect do |park|
             place = self.new
             place.name = park.css('h2').text.strip.gsub("Book a Hotel", "").gsub("\n", "")
             place.location = park.css('h3 span').text.strip.gsub("\n", "")
             place.description = park.css("p").text

             place
             end
           end
         end
       end
