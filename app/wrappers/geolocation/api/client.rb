module Geolocation
	module Api
    	class Client
            BASE_URL = 'http://api.ipstack.com/'.freeze

            def get_location
                send_request(:get, "check", :access_key => 'e82191a13933c5981794dd2793fdb4cd')
                # 
            end

            def send_request(http_method, path_to_resource, params={})
                connection = Faraday.new(url: BASE_URL, params: params)
                response = connection.public_send(http_method, path_to_resource)
                JSON.parse(response.body)
            end
        end        
    end
end