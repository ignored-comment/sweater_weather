require 'rails_helper'

RSpec.describe 'Brewery Service' do
    describe 'brewery service' do
        it 'can get a successful connection' do
            location = MapFacade.get_lat_long("Charlotte, NC")
            response = BreweryService.get_breweries([location.lat, location.lng], 2)

            expect(response).to be_a(Array)
            expect(response.count).to eq(2)
            expect(response.first).to be_a(Hash)
        end

        it 'can get a successful connection with a London, UK' do
            location = MapFacade.get_lat_long("London, UK")
            response = BreweryService.get_breweries([location.lat, location.lng], 5)

            expect(response).to be_a(Array)
            expect(response.count).to be(5)
            expect(response.first).to be_a(Hash)
        end
    end
end