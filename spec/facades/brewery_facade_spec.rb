require 'rails_helper'

RSpec.describe 'BreweryFacade' do
    it 'returns brewery objects' do
        city_state = "Houston,TX"
        location = MapFacade.get_lat_long(city_state)
        response = BreweryFacade.get_city_current_weather_and_breweries(city_state, [location.lat, location.lng], 3)

        expect(response).to be_a(Brewery)
        expect(response.destination).to be_a(String)
        expect(response.breweries).to be_a(Array)
        expect(response.breweries.count).to eq(3)
        expect(response.forecast).to be_a(Hash)
    end
end