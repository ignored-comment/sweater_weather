require 'rails_helper'

RSpec.describe 'WeatherFacade' do
    it 'returns weather objects' do
        location = MapFacade.get_lat_long("Houston,TX")

        response = ForecastFacade.get_hourly_daily_current_weather(location.lat, location.lng)

        expect(response).to be_a(Forecast)
        expect(response.current_weather).to be_a(CurrentWeather)
        expect(response.hourly_weather).to be_a(Array)
        expect(response.hourly_weather.first).to be_a(HourlyWeather)
        expect(response.daily_weather).to be_a(Array)
        expect(response.daily_weather.first).to be_a(DailyWeather)
    end
end