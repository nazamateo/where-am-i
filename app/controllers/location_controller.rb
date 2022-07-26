class LocationController < ApplicationController

    def index
        location_client = Geolocation::Api::Client.new
        @location = location_client.get_location
    
        advise_client = Advise::Api::Client.new
        @random_advise = advise_client.get_random_advise        
    end
end
