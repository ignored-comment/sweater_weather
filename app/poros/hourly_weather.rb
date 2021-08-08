class HourlyWeather
    attr_reader :date_time,
                :temp,
                :conditions,
                :icon

    def initialize(data)
        @date_time = Time.at(data[:dt]).to_s
        @temp = data[:temp]
        @conditions = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end
end