class MapService
    class << self
        def get_address(location)
            response = conn.get("/geocoding/v1/address?key=#{ENV['MAPQUEST_API']}&location=#{location}")
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