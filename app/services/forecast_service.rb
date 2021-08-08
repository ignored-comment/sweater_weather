class ForecastService
    class << self
        def get_weather(lat, lng)
            response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=imperial&exclude=minutely,alerts&appid=#{ENV['WEATHER_API']}")
            parse_json(response)
        end

        private

        def conn
            Faraday.new('https://api.openweathermap.org')
        end

        def parse_json(response)
            JSON.parse(response.body, symbolize_names: true)
        end
    end
end