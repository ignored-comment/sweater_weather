class Route
    attr_reader :id,
                :start_city,
                :end_city,
                :travel_time
    def initialize(data, forecast)
        @id = nil
        @hours_to_arrival = nil
        @days_to_arrival = nil
        @start_city = "#{data[:locations][0][:adminArea5]}, #{data[:locations][0][:adminArea3]}"
        @end_city = "#{data[:locations][1][:adminArea5]}, #{data[:locations][1][:adminArea3]}"
        @travel_time = "#{data[:formattedTime].split(":")[0]} hour(s), #{data[:formattedTime].split(":")[1]} minute(s)"
        @forecast = forecast
        if data[:formattedTime].split(":")[0].to_i < 8
            @hours_to_arrival = data[:formattedTime].split(":")[0].to_i
        elsif data[:formattedTime].split(":")[0].to_i > 8
            @days_to_arrival = data[:formattedTime].split(":")[0].to_i.fdiv(24).round
        end
    end

    def weather_at_eta
        if @hours_to_arrival != nil
            weather = @forecast.hourly_weather[@hours_to_arrival]
            {
                temperature: weather.temp,
                conditions: weather.conditions
            }
        elsif @days_to_arrival != nil
            weather = @forecast.daily_weather[@days_to_arrival - 1]
            {
                minimum_temperature: weather.min_temp,
                maximum_temperature: weather.max_temp,
                conditions: weather.conditions
            }
        end
    end
end