require 'spec_helper.rb'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
  end

  describe '# initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of VehicleFactory
    end
  end

  describe '# accurately returns data' do
    it 'returns array of vehicle objects with specified values' do
      new_list = @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a Array

      new_list.each do |list_item|
        expect(list_item).to be_an_instance_of Vehicle
        expect(list_item.engine).to eq :ev
        expect(list_item.registration_date).to eq nil
        expect(list_item.plate_type).to eq nil
      end
    end
  end
end