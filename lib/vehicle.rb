require 'date'

class Vehicle

    attr_reader :vin, 
                :year, 
                :make, 
                :model,
                :engine, 
                :registration_date,
                :plate_type,
                :fees

    def initialize(vehicle_details)
        @vin = vehicle_details[:vin]
        @year = vehicle_details[:year]
        @make = vehicle_details[:make]
        @model = vehicle_details[:model]
        @engine = vehicle_details[:engine]
        @registration_date
        @plate_type
        @fees = 0
    end

    # Methods

    def change_registration_date
        @registration_date = Date.today
    end

    def update_plate_type
        if antique?
            @plate_type = :antique
            @fees += 25
        elsif electric_vehicle?
            @plate_type = :ev
            @fees += 200
        else
            @plate_type = :regular
            @fees += 100
        end
    end

    # Special Instances

    def antique?
        Date.today.year - @year > 25
    end

    def electric_vehicle?
        @engine == :ev
    end
  
end
