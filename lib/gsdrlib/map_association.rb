module Gsdrlib
  module MapAssociation
  
    def map_association(association)
      association.map {|item| { "#{item.id}" => item }}.reduce({}, :update)
    end
    
  end
end