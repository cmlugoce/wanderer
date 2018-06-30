module Wanderer
  class CLI



    def call
       greeting
       list_destination

     end

     def greeting
       puts ""
       puts "--*-- HIIIIIIIIIIIIIIII --*--"
       puts ""
       puts ""
     end

     def list_destination
       puts ""
       @places = Wanderer::Wander.get_page
       @places.each.with_index do |place, i|
         puts "#{i+1}. #{place.name}"
       end
     end







  end #of class

end #of module


