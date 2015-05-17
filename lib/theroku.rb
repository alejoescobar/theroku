module Theroku
  @base_url = 'http://therokubalance.com/api/'
  class << self
    attr_accessor :base_url
  end
end

require 'theroku/create_command.rb'
require 'theroku/destroy_command.rb'
require 'theroku/login_command.rb'
require 'theroku/update_command.rb'
require 'theroku/open_command.rb'
require 'theroku/list_command.rb'