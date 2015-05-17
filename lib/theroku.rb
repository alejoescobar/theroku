module Theroku
  @base_url = 'http://192.168.0.18:3000/api/'
  class << self
    attr_accessor :base_url
  end
end

require 'theroku/create_command.rb'
require 'theroku/destroy_command.rb'
require 'theroku/login_command.rb'
require 'theroku/update_command.rb'