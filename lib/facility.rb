class Facility

    attr_reader :name,
                :address, 
                :phone, 
                :services,
                :registered_vehicles,
                :collected_fees

    def initialize(facility_info)
        @name = facility_info[:name] 
        @address = facility_info[:address]
        @phone = facility_info[:phone]
        @services = []
        @registered_vehicles = []
        @collected_fees = 0
    end

    # Methods

    def add_service(service)
        @services << service
    end

    def collect_fees
    end

    # A facility must include the service in order to perform it

    # Register a Vehicle
    def register_vehicle(vehicle)
        if @services.include? ("Vehicle Registration")
            vehicle.change_registration_date
            vehicle.update_plate_type
            @registered_vehicles << vehicle
        end
    end
        # Vehicles 25 years or older are considered antique and cost $25 to register
        # Electric Vehciles cost $200 to register
        # All other vehicles cost $100 to register
        # A vehicles's plate type should be set upon successful registration

    # Administer a Written Test
        # A written test can only be administered to registrants with a permit and are at least 16 years of age

    # Administer a Road Test
        # A road test can only be administered to registrants who have passed the written test
        # Registrants who qualify for the road test automatically earn a license

    # Renew a Driver's License
        # A license can only be renewed if the registrant has already passed the road test

end
