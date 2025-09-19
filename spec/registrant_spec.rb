require 'spec_helper.rb'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
    @registrant_3 = Registrant.new('Jacqueline', 47)
  end

  describe '# initialize' do
    it 'registrants can exist' do
      expect(@registrant_1).to be_an_instance_of Registrant
      expect(@registrant_2).to be_an_instance_of Registrant
    end

    it 'registrants have names' do
      expect(@registrant_1.name).to eq "Bruce"
      expect(@registrant_2.name).to eq "Penny"
    end

    it 'registrants have an age' do
      expect(@registrant_1.age).to eq 18
      expect(@registrant_2.age).to eq 15
    end

    it 'registrants have a permit if specified' do
      expect(@registrant_1.permit).to eq true
      expect(@registrant_2.permit).to eq false
      expect(@registrant_3.permit).to eq false
    end

    it 'registrants have blank license data' do
      expect(@registrant_1.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq ({:written=>false, :license=>false, :renewed=>false})
    end
  end
end