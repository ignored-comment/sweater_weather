class Weather
    attr_reader :id, :current_weather, :daily_weather

    def initialize(data)
        @id = nil
        @current_weather = CurrentWeather.new(data[:current])
        @daily_weather = data[:daily].first(5)
    end

    def daily_weather
        @daily_weather.map do |day|
            DailyWeather.new(day)
        end
    end
end