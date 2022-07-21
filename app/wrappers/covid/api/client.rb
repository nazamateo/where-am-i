module Covid
	module Api
    	class Client
            BASE_URL = 'https://api.covid19api.com'.freeze
            #https://documenter.getpostman.com/view/10808728/SzS8rjbc#7934d316-f751-4914-9909-39f1901caeb8

            def get_covid_data_by_country(country)
                send_request(:get, "total/dayone/country/#{country}")
                # https://api.covid19api.com/total/dayone/country/philippines
            end

            def send_request(http_method, path_to_resource, params={})
                connection = Faraday.new(url: BASE_URL, params: params)
                response = connection.public_send(http_method, path_to_resource)
                JSON.parse(response.body)
            end
        end        
    end
end