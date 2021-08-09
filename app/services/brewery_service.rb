class BreweryService
    class << self
        def get_breweries(lat, lng)
            response = conn.get("/breweries?by_dist=#{lat},#{lng}")
            parse_json(response)
        end

        private

        def conn
            Faraday.new('https://api.openbrewerydb.org')
        end

        def parse_json(response)
            JSON.parse(response.body, symbolize_names: true)
        end
    end
end