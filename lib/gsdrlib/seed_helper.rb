module Gsdrlib
  class SeedHelper
    def self.process(definitions, model, key_column)
      find_method_name = "find_by_#{key_column.to_s}"
    
      definitions.each do |definition|
        existing_item = model.send(find_method_name, definition[key_column])
        if existing_item
          existing_item.update_attributes(definition)
        else
          model.create(definition)
        end
      end
    end
  end
end
