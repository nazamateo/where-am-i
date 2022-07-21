module Geolocation
	module Api
    	class Client
            BASE_URL = 'http://api.ipstack.com/'.freeze
            #https://ipstack.com/quickstart

            def get_location
                send_request(:get, "check", :access_key => '126dc8a499f871199fd9cd50aeb3aa8a')
            end

            def send_request(http_method, path_to_resource, params={})
                connection = Faraday.new(url: BASE_URL, params: params)
                response = connection.public_send(http_method, path_to_resource)
                JSON.parse(response.body)
            end
        end        
    end
end