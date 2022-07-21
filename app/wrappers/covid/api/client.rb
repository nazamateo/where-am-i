module Covid
	module Api
    	class Client
            BASE_URL = 'https://api.covid19api.com'.freeze

            def get_covid_data_by_country(country)
                send_request(:get, "total/dayone/country/#{country}")
            end

            def send_request(http_method, path_to_resource, params={})
                connection = Faraday.new(url: BASE_URL, params: params)
                response = connection.public_send(http_method, path_to_resource)
                JSON.parse(response.body)
            end
        end        
    end
end