require 'colorize'

module Wanderer
  class CLI



    def call
       greeting
       Wanderer::Scraper.get_page
       list_destination
       menu
       goodbye
     end

     def greeting
       puts ""
       puts "--*--Not all who wander are lost! --*--".magenta.bold
       puts ""
       puts "Welcome to Wander! Are you ready to check out the top 15 long-distance hikes around the world?".magenta.bold
        puts "Enter the number of the destination to get a brief description"
       puts ""
     end

     def list_destination
       puts ""
       @places = Wanderer::Wander.all

       @places.each.with_index do |place, i|
         puts "#{i+1}. #{place.name}, #{place.location}".blue
       end
     end
     def menu
         input = nil
         while input != "bye"
           puts ""
           puts ""
           puts "Type 'list' to return to the list. Type 'bye' to quit the program".red.bold
           input = gets.strip.downcase

           if input.to_i > 0 && input.to_i < 16
             place = @places[input.to_i-1]

             puts "-- #{place.name} - #{place.location}-- ".green.bold
             puts ""
             puts "Distance: #{place.distance}".yellow.bold
             puts ""
             puts "#{place.description}"
             puts ""

           elsif input == "list"
               list_destination
           elsif input == 'bye'

           else
             puts "Invalid input. Please try again.".red
           end
         end
       end

       def goodbye

         puts "Bye!! Thanks for visiting!".blue.bold
       end






  end #of class

end #of module
