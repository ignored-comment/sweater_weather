require 'rails_helper'

RSpec.describe 'Brewery Service' do
    describe 'brewery service' do
        it 'can get a successful connection' do
            location = MapFacade.get_lat_long("Charlotte, NC")
            response = BreweryService.get_breweries(location.lat, location.lng)

            expect(response).to be_a(Array)
            expect(response.first).to be_a(Hash)
        end
    end
end