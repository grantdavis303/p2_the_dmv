require './lib/dmv.rb'
require './lib/dmv_data_service.rb'
require './lib/facility.rb'
require './lib/facility_factory.rb'
require './lib/registrant.rb'
require './lib/vehicle.rb'
require './lib/vehicle_factory.rb'

# Testing Iteration 1

puts "Testing Iteration 1"

registrant_1 = Registrant.new('Bruce', 18, true)
registrant_2 = Registrant.new('Penny', 15)

registrant_1.name
registrant_1.age
registrant_1.permit?
registrant_1.license_data
registrant_2.name
registrant_2.age
registrant_2.permit?
registrant_2.license_data
registrant_2.earn_permit
registrant_2.permit?

# Testing Iteration 2

puts "Testing Iteration 2"

factory = VehicleFactory.new
wa_ev_registrations = DmvDataService.new.wa_ev_registrations

factory.create_vehicles(wa_ev_registrations)

registrant_1 = Registrant.new('Bruce', 18, true )
registrant_2 = Registrant.new('Penny', 16 )
registrant_3 = Registrant.new('Tucker', 15 )
facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})

registrant_1.license_data
registrant_1.permit?
facility_1.administer_written_test(registrant_1)
registrant_1.license_data
facility_1.add_service('Written Test')
facility_1.administer_written_test(registrant_1)
registrant_1.license_data
registrant_2.age
registrant_2.permit?
facility_1.administer_written_test(registrant_2)
registrant_2.earn_permit
facility_1.administer_written_test(registrant_2)
registrant_2.license_data
registrant_3.age
registrant_3.permit?
facility_1.administer_written_test(registrant_3)
registrant_3.earn_permit
facility_1.administer_written_test(registrant_3)
registrant_3.license_data

facility_1.administer_road_test(registrant_3)
registrant_3.earn_permit
facility_1.administer_road_test(registrant_3)
registrant_3.license_data
facility_1.administer_road_test(registrant_1)
facility_1.add_service('Road Test')
facility_1.administer_road_test(registrant_1)
registrant_1.license_data
facility_1.administer_road_test(registrant_2)
registrant_2.license_data

facility_1.renew_drivers_license(registrant_1)
facility_1.add_service('Renew License')
facility_1.renew_drivers_license(registrant_1)
registrant_1.license_data
facility_1.renew_drivers_license(registrant_3)
registrant_3.license_data
facility_1.renew_drivers_license(registrant_2)
registrant_2.license_data

facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

facility_1.add_service('Vehicle Registration')
cruz.registration_date
facility_1.registered_vehicles
facility_1.collected_fees
facility_1.register_vehicle(cruz)
cruz.registration_date
cruz.plate_type
facility_1.registered_vehicles
facility_1.collected_fees
facility_1.register_vehicle(camaro)
camaro.registration_date
camaro.plate_type
facility_1.register_vehicle(bolt)
bolt.registration_date
bolt.plate_type
facility_1.registered_vehicles
facility_1.collected_fees
facility_2.registered_vehicles
facility_2.services
facility_2.register_vehicle(bolt)
facility_2.registered_vehicles
facility_2.collected_fees

# Testing Iteration 3

puts "Testing Iteration 3"

factory = FacilityFactory.new

colorado = DmvDataService.new.co_dmv_office_locations
factory.create_facilities(colorado)

new_york = DmvDataService.new.ny_dmv_office_locations
factory.create_facilities(new_york)

missouri = DmvDataService.new.mo_dmv_office_locations
factory.create_facilities(missouri)

puts "Everything was a success!"