class BreweryFacade
    class << self
        def get_city_current_weather_and_breweries(city_state, location, quantity)
            forecast = get_weather(location)
            breweries = BreweryService.get_breweries(location, quantity)
            Brewery.new(city_state, breweries, forecast)
        end

        def get_weather(location)
            weather = ForecastFacade.get_hourly_daily_current_weather(location[0], location[1]).current_weather
        end
    end
end