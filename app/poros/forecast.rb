class Forecast
    attr_reader :id, :current_weather

    def initialize(data)
        @id = nil
        @current_weather = CurrentWeather.new(data[:current])
        @daily_weather = data[:daily].first(5)
        @hourly_weather = data[:hourly].first(8)
    end

    def daily_weather
        @daily_weather.map do |day|
            DailyWeather.new(day)
        end
    end

    def hourly_weather
        @hourly_weather.map do |hourly|
            HourlyWeather.new(hourly)
        end
    end
end