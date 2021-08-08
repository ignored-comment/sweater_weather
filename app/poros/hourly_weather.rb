class HourlyWeather
    attr_reader :datetime,
                :temp,
                :conditions,
                :icon

    def initialize(data)
        @datetime = Time.at(data[:dt]).to_s
        @temp = data[:temp]
        @conditions = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end
end