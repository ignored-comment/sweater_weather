class NoRoute
    attr_reader :id,
                :start_city,
                :end_city,
                :travel_time,
                :weather_at_eta

    def initialize(starting_destination, ending_destination)
        @id = nil
        @start_city = "#{starting_destination.split[0].capitalize}, #{starting_destination.split[1].upcase}"
        @end_city = "#{ending_destination.split[0].capitalize}, #{ending_destination.split[1].upcase}"
        @travel_time = "Impossible"
        @weather_at_eta = {}
    end
end