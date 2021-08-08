require 'rails_helper'

RSpec.describe 'Weather Service' do
    describe 'weather service' do
        it 'can get a successful connection' do
            location = MapFacade.get_lat_long("Charlotte, NC")
            response = WeatherService.get_weather(location.lat, location.lng)

            expect(response).to be_a(Hash)
            expect(response[:current]).to be_a(Hash)
            expect(response[:hourly]).to be_a(Array)
            expect(response[:daily]).to be_a(Array)
            expect(response).to_not have_key(:minutely)
            expect(response).to_not have_key(:alerts)
        end
    end
end