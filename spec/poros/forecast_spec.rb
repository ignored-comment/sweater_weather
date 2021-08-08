require 'rails_helper'

RSpec.describe 'Weather Poro' do
    describe 'it can encapsulate and retrieve information' do
        it 'can take data and encapsulate it' do
            location = MapFacade.get_lat_long("Beijing, China")
            data = ForecastService.get_weather(location.lat, location.lng)
            
            beijing = Forecast.new(data)

            expect(beijing.id).to be_nil
            expect(beijing.current_weather).to be_instance_of CurrentWeather
            expect(beijing.daily_weather.first).to be_instance_of DailyWeather
            expect(beijing.daily_weather.count).to be(5)
            expect(beijing.hourly_weather.first).to be_instance_of HourlyWeather
            expect(beijing.hourly_weather.count).to be(8)
        end
    end
end