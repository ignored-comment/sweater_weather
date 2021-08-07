require 'rails_helper'

RSpec.describe 'Map Facade' do
    describe 'returns latitude and longitude for a location' do
        it 'can return a Location object' do
            location = MapFacade.get_lat_long("Charlotte, NC")
            expect(location).to be_a(Location)
            expect(location.lat).to eq(35.222936)
            expect(location.lng).to eq(-80.840161)
        end
    end
end