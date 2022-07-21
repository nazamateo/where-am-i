class StaticController < ApplicationController

  def home
    location_client = Geolocation::Api::Client.new
    @location = location_client.get_location

    advise_client = Advise::Api::Client.new
    @random_advise = advise_client.get_random_advise

    country_client = Country::Api::Client.new
    @countries = country_client.get_all_countries.sort_by{|c| c['continents']}
  end
end
