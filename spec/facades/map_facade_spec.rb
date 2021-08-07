require 'rails_helper'

RSpec.describe 'Map Facade' do
    describe 'returns latitude and longitude for a location' do
        it 'can return a Location object' do
            location = MapFacade.get_lat_long("Charlotte, NC")
            expect(location).to be_a(Location)
            expect(location.lat).to eq(35.222936)
            expect(location.lng).to eq(-80.840161)
        end

        it 'can return a Location object for Huntersville NC' do
            location = MapFacade.get_lat_long("Huntersville,NC")

            expect(location).to be_a(Location)
            expect(location.lat).to eq(35.410565)
            expect(location.lng).to eq(-80.848994)
        end

        it 'can return a Location object for Sheffield, UK' do
            location = MapFacade.get_lat_long("Sheffield, UK")

            expect(location).to be_a(Location)
            expect(location.lat).to eq(53.34347)
            expect(location.lng).to eq(-1.38213)
        end

        it 'can return a Location object for Beijing, China' do
            location = MapFacade.get_lat_long("Beijing, China")

            expect(location).to be_a(Location)
            expect(location.lat).to eq(39.90647)
            expect(location.lng).to eq(116.391195)
        end
    end
end