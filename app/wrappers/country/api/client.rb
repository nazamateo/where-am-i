module Country
	module Api
    	class Client
            BASE_URL = 'https://restcountries.com/v3.1'.freeze
            #https://restcountries.com/#api-endpoints-v3-full-name
           
            def get_all_countries
                send_request(:get, 'all')
            end

            def get_country_details(country)
                send_request(:get, "name/#{country}", :fullText => true)
            end
           
            def send_request(http_method, path_to_resource, params={})
                connection = Faraday.new(url: BASE_URL  , params: params)
                response = connection.public_send(http_method, path_to_resource)
                JSON.parse(response.body)
            end
        end        
    end
end
