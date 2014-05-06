module Gsdrlib
  class SimpleConfig

    def initialize(yaml_file_name)
      @data = YAML.load_file(Rails.root.join('config', yaml_file_name))
      @env_data = @data[Rails.env]
    end
  
    def method_missing(name, *args, &block)
      name_str = name.to_s
      if @data.has_key?(name_str)
        @data[name_str]
      elsif @env_data.has_key?(name_str)
        @env_data[name_str]
      else
        super
      end
    end
  end
end
