require 'rails_helper'

RSpec.describe 'Weather Poro' do
    describe 'it can encapsulate and retrieve information' do
        it 'can take data and encapsulate it' do
            location = MapFacade.get_lat_long("Beijing, China")
            data = WeatherService.get_weather(location.lat, location.lng)

            beijing = Weather.new(data)

            expect(beijin.id).to be(Nil)
            expect(beijing.current_weather).to be_instance_of CurrentWeather
        end
    end
end