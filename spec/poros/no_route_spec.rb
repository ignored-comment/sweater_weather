require 'rails_helper'

RSpec.describe 'NoRoutes Poro' do
    describe 'it instantiates and returns route' do
        it 'can take data and return an object' do
            starting_destination = "Beijing, China"
            ending_destination = "Charlotte, NC"
            route = NoRoute.new(starting_destination, ending_destination)
            
            expect(route).to be_a(NoRoute)
            expect(route.id).to be_nil
            expect(route.start_city).to be_a(String)
            expect(route.end_city).to be_a(String)
            expect(route.travel_time).to be_a(String)
            expect(route.weather_at_eta).to be_a(Hash)
            end
        end
    end