require 'spec_helper.rb'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15)
  end

  describe '# initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of Facility
      expect(@facility.name).to eq 'DMV Tremont Branch'
      expect(@facility.address).to eq '2855 Tremont Place Suite 118 Denver CO 80205'
      expect(@facility.phone).to eq '(720) 865-4600'
      expect(@facility.services).to eq []
      expect(@facility.registered_vehicles).to eq []
      expect(@facility.collected_fees).to eq 0
    end
  end

  describe '# add service' do
    it 'can add available services' do
      expect(@facility.services).to eq []

      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')

      expect(@facility.services).to eq ['New Drivers License', 'Renew Drivers License', 'Vehicle Registration']
    end
  end

  describe '# registers a vehicle' do
    it 'will not register a vehicle if service is not included' do
      expect(@facility.registered_vehicles).to eq []

      @facility.register_vehicle(@cruz)

      expect(@facility.registered_vehicles).to eq []
    end

    it 'will register a vehicle if service is included' do
      expect(@facility.registered_vehicles).to eq []

      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)

      expect(@facility.registered_vehicles).to eq [@cruz]
    end

    describe '# collects fees' do
      it 'collects fees (antique)' do
        expect(@camaro.plate_type).to eq nil

        @facility.add_service('Vehicle Registration')
        @facility.register_vehicle(@camaro)

        expect(@facility.collected_fees).to eq 25
      end

      it 'collects fees (ev)' do
        expect(@bolt.plate_type).to eq nil

        @facility.add_service('Vehicle Registration')
        @facility.register_vehicle(@bolt)

        expect(@facility.collected_fees).to eq 200
      end

      it 'collects fees (regular)' do
        expect(@cruz.plate_type).to eq nil

        @facility.add_service('Vehicle Registration')
        @facility.register_vehicle(@cruz)

        expect(@facility.collected_fees).to eq 100
      end
    end
  end

  describe '# administers a written test' do
    it 'will not administer a written test if service is not included' do
      expect(@facility.administer_written_test(@registrant_1)).to eq false

      @facility.administer_written_test(@registrant_1)

      expect(@facility.administer_written_test(@registrant_1)).to eq false
    end

    it 'will administer a written test if service is included' do
      expect(@facility.administer_written_test(@registrant_1)).to eq false

      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)

      expect(@facility.administer_written_test(@registrant_1)).to eq true
    end
  end

  describe '# administers a road test' do
    it 'will not administer a road test if service is not included' do
      expect(@facility.administer_road_test(@registrant_1)).to eq false

      @facility.administer_road_test(@registrant_1)

      expect(@facility.administer_road_test(@registrant_1)).to eq false
    end

    it 'will administer a road test if service is included' do
      expect(@facility.administer_road_test(@registrant_1)).to eq false

      @facility.add_service('Road Test')
      @facility.administer_road_test(@registrant_1)

      expect(@facility.administer_road_test(@registrant_1)).to eq true
    end
  end

  describe '# renews a license test' do
    it 'will not renew a license if service is not included' do
      expect(@facility.renew_drivers_license(@registrant_1)).to eq false

      @facility.renew_drivers_license(@registrant_1)

      expect(@facility.renew_drivers_license(@registrant_1)).to eq false
    end

    it 'will renew a license if service is included' do
      expect(@facility.renew_drivers_license(@registrant_1)).to eq false

      @facility.add_service('Road Test')
      @facility.add_service('Renew License')
      @facility.administer_road_test(@registrant_1)
      @facility.renew_drivers_license(@registrant_1)

      expect(@facility.renew_drivers_license(@registrant_1)).to eq true
    end
  end
end