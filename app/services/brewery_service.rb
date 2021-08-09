class BreweryService
    class << self
        def get_breweries(location, quantity)
            response = conn.get("/breweries?by_dist=#{location[0]},#{location[1]}")
            parse_json(response).first(quantity)
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