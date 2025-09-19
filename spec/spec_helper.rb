require 'pry'

require './lib/dmv.rb'
require './lib/dmv_data_service.rb'
require './lib/facility.rb'
require './lib/facility_factory.rb'
require './lib/registrant.rb'
require './lib/vehicle.rb'
require './lib/vehicle_factory.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end