require 'spec_helper.rb'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @colorado_facilities = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '# initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of FacilityFactory
    end
  end

  describe '# accurately returns data' do
    it 'create_facilities method returns array of facility objects' do
      new_list = @factory.create_facilities(@colorado_facilities)

      expect(@factory.create_facilities(@colorado_facilities)).to be_a Array

      new_list.each do |list_item|
        expect(list_item).to be_an_instance_of Facility
      end
    end

    describe '# accurately returns data based on location' do
      it 'accurately returns data for Colorado locations' do
        colorado_list = @factory.create_facilities(@colorado_facilities)

        expect(colorado_list[0].name).to eq "DMV Northeast Branch"
        expect(colorado_list[0].address).to eq "4685 Peoria Street Suite 101, Denver, CO 80239"
        expect(colorado_list[0].phone).to eq "(720) 865-4600"
      end

      it 'accurately returns data for New York locations' do
        new_york_list = @factory.create_facilities(@new_york_facilities)

        expect(new_york_list[0].name).to eq "HERKIMER"
        expect(new_york_list[0].address).to eq "109 MARY STREET, HERKIMER, NY 13350"
        expect(new_york_list[0].phone).to eq "3158671130"
      end

      it 'accurately returns data for Missouri locations' do
        missouri_list = @factory.create_facilities(@missouri_facilities)

        expect(missouri_list[0].name).to eq "North Kansas City"
        expect(missouri_list[0].address).to eq "2421 Burlington DR, STE B, North Kansas City, MO 64116"
        expect(missouri_list[0].phone).to eq "(816) 710-6600"
      end
    end
  end
end