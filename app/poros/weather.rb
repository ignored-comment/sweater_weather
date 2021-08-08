class Weather
    attr_reader :id, :current_weather

    def initialize(data)
        @id = nil
        # @current_weather = CurrentWeather.new(data[:current])
    end
end