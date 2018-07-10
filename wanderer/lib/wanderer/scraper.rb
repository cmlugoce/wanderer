module Wanderer
  class Scraper

def self.get_page

     doc = Nokogiri::HTML(open("https://www.fodors.com/news/photos/15-amazing-long-distance-hikes-around-the-world"))

     trips = doc.css(".container.slides")
     trips.collect do |hike|
       place = Wanderer::Wander.new
       place.name = hike.css("h2").text.strip.gsub("Book a Hotel", "").gsub("\n", "").strip
       place.location = hike.css("h3 span").text.strip.gsub("\n", "")
       place.distance = hike.css("p").children[1].text
       place.description = hike.css("p").children[2..20].text.strip.gsub("\n", "").strip
       place.url = hike.css("a").attr("href").text


       end
     end

   end
 end
