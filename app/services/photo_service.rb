class PhotoService
    class << self
        def get_photo(city_state)
            response = conn.get("/search/photos?client_id=#{ENV['UNSPLASH_API']}&page=1&query=#{city_state}")
            parse_json(response)
        end

        private

        def conn
            Faraday.new('https://api.unsplash.com')
        end

        def parse_json(response)
            JSON.parse(response.body, symbolize_names: true)
        end
    end
end