class MapFacade
    class << self
        def get_lat_long(location)
            json = MapService.get_address(location)
            location_data = json[:results].first[:locations].first[:latLng]
            Location.new(location_data)
        end

        def get_route(starting_destination, ending_destination)
            json = MapService.get_route(starting_destination, ending_destination)
            map_data = json[:route]
            forecast = get_ending_destination_forecast(ending_destination) 
            Route.new(map_data, forecast)
        end

        def get_ending_destination_forecast(ending_destination)
            location = MapFacade.get_lat_long(ending_destination)
            ForecastFacade.get_hourly_daily_current_weather(location.lat, location.lng)
        end
    end
end