class MapFacade
    class << self
        def get_lat_long(location)
            json = MapService.get_address(location)
            data = json[:results].first[:locations].first[:latLng]
            Location.new(data)
        end

        def get_route(starting_destination, ending_destination)
            json = MapService.get_route(starting_destination, ending_destination)
            data = json[:route]
            Route.new(data)
        end
    end
end