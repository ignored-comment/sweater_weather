require 'rails_helper'

RSpec.describe 'Map Facade' do
    describe 'returns latitude and longitude for a location' do
        it 'can return a Location object' do
            location = MapFacade.get_lat_long("Charlotte, NC")
            expect(location).to be_a(Location)
            expect(location.lat).to be_a(Float)
            expect(location.lng).to be_a(Float)
        end

        it 'can return a Location object for Huntersville NC' do
            location = MapFacade.get_lat_long("Huntersville,NC")

            expect(location).to be_a(Location)
            expect(location.lat).to be_a(Float)
            expect(location.lng).to be_a(Float)
        end

        it 'can return a Location object for Sheffield, UK' do
            location = MapFacade.get_lat_long("Sheffield, UK")

            expect(location).to be_a(Location)
            expect(location.lat).to be_a(Float)
            expect(location.lng).to be_a(Float)
        end

        it 'can return a Location object for Beijing, China' do
            location = MapFacade.get_lat_long("Beijing, China")

            expect(location).to be_a(Location)
            expect(location.lat).to be_a(Float)
            expect(location.lng).to be_a(Float)
        end
    end

    describe 'returns the route when inputting cities' do
        it "can return a route object from charlotte nc to huntersville nc" do
            route = MapFacade.get_route("Charlotte, NC", "Huntersville, NC")

            expect(route).to be_a(Route)
            expect(route.id).to be_nil
            expect(route.start_city).to be_a(String)
            expect(route.end_city).to be_a(String)
            expect(route.travel_time).to be_a(String)
            expect(route.weather_at_eta).to be_a(Hash)
        end

        it "can return a route object from atlanta ga to charlotte nc" do
            route = MapFacade.get_route("Atlanta, GA", "Charlotte, NC")

            expect(route).to be_a(Route)
            expect(route.id).to be_nil
            expect(route.start_city).to be_a(String)
            expect(route.end_city).to be_a(String)
            expect(route.travel_time).to be_a(String)
            expect(route.weather_at_eta).to be_a(Hash)
        end
    end
end