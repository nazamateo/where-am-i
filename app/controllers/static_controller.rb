class StaticController < ApplicationController

  def home
    country_client = Country::Api::Client.new
    @countries = country_client.get_all_countries.sort_by{|c| c['name']['common']}
  end

  def show
    covid_data_client = Covid::Api::Client.new
    @covid_data = covid_data_client.get_covid_data_by_country(params[:country].gsub(/\s+/, '-'))

    country_client = Country::Api::Client.new
    @country = country_client.get_country_details(params[:country].gsub(/\s+/, '%20'))
  end
end
