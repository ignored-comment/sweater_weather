class Brewery
    attr_reader :id,
                :destination

    def initialize(city_state, breweries, forecast)
        @id = nil
        @destination = city_state.strip.downcase
        @forecast = forecast
        @breweries = breweries
    end

    def breweries
        @breweries.map do |brew|
            {
                id: brew[:id],
                name: brew[:name],
                brewery_type: brew[:brewery_type]
            }
        end
    end

    def forecast
        {
            summary: @forecast.conditions,
            temperature: "#{@forecast.temp} F"
        }
    end
end