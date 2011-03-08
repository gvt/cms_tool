module Cms
  class Base
    cattr_accessor :username, :password
    cattr_accessor :config_filename

    ##
    # attempt to load the config file
    def self.load_config(fake_it = false)
      return true if fake_it
      config_file = @@config_filename || "cms_plugin.config.rb"
      config_path = File.join(Rails.root.to_s, 'config', config_file)

      raise Exception.new "config file absent, expected location [#{config_path}]" unless File.exists? config_path

      config_hash = YAML::load File.open(config_path).read
      @@username   = config_hash['username']
      @@password   = config_hash['password']
    end

  end
end
