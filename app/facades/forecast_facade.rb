class ForecastFacade
    class << self
        def get_hourly_daily_current_weather(lat,lng)
            json = ForecastService.get_weather(lat, lng)
            Forecast.new(json)
        end
    end
end