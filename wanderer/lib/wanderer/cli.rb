require 'colorize'

module Wanderer
  class CLI



    def call
       greeting
       list_destination
       menu
       goodbye

     end

     def greeting
       puts ""
       puts "--*--Not all those who wander are lost! --*--".magenta.bold
       puts ""
       puts "Welcome to Wander! Are you ready to check out the top 14 most beautiful National Parks?"
       puts ""
     end

     def list_destination
       puts ""
       @places = Wanderer::Wander.get_page
       @places.each.with_index do |place, i|
         puts "#{i+1}. #{place.name}, #{place.location}"
       end
     end
     def menu
         input = nil
         while input != "ciao"
           puts ""
           puts "Enter the number of the park to get a brief description".magenta.bold
           puts ""
           puts "Type 'list' to see the top seashore National Parks. Type 'ciao' to quit the program".red.bold
           input = gets.strip

           if input.to_i > 0
            place = @places[input.to_i-1]

             puts "-- #{place.name} - #{place.location}-- ".green.bold
             puts ""
             puts ""
             puts "#{place.description}"
             puts ""
           elsif input == "list"
               list_destination
             elsif input == 'ciao'
               goodbye
           elsif
             puts "Invalid input. Please try again.".red.bold
           end
         end
       end

       def goodbye

         puts "Ciao!! Thanks for visiting!".blue.bold
       end






  end #of class

end #of module
