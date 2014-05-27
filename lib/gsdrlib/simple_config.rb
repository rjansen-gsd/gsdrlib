module Gsdrlib
  class SimpleConfig

    def initialize(yaml_file_name)
      @data = YAML.load_file(Rails.root.join('config', yaml_file_name))
      @env_data = @data[Rails.env]
    end
  
    def method_missing(name, *args, &block)
      name_str = name.to_s
			if name_str.end_with?('?')
				value = read_key(name_str.slice(0..-2))
			else
				value = read_key(name_str)
			end

			return value unless value.nil?
			super
		end

	private
		def read_key(key)
			if @env_data && @env_data.has_key?(key)
				@env_data[key]
			else
				@data[key]
			end
		end
  end
end
