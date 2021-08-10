class MapService
    class << self
        def get_address(location)
            response = conn.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_API']}&location=#{location}")
            parse_json(response)
        end

        def get_route(starting_destination, ending_destination)
            response = conn.get("/directions/v2/route?key=#{ENV['MAPQUEST_API']}&from=#{starting_destination}&to=#{ending_destination}")
            parse_json(response)
        end

        private

        def conn
            Faraday.new('http://www.mapquestapi.com')
        end

        def parse_json(response)
            JSON.parse(response.body, symbolize_names: true)
        end
    end
end