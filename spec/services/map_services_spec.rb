require 'rails_helper'

RSpec.describe 'Map Service' do 
    describe 'latitude and longitude' do
        it 'can get latitude and longitude from a city' do
            response = MapService.get_address("Charlotte,NC")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
        end

        it 'can get latitude and longitude from a two-worded city' do
            response = MapService.get_address("San Francisco,CA")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
        end

        it 'can get latitude and longitude from a three-worded city' do
            response = MapService.get_address("New York City,NY")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
        end

        it 'can get latitude and longitude from a mispelled city' do
            response = MapService.get_address("Springfeild,IL")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
        end
    end

    describe 'get route' do
        it 'can get a response for the route and estimated travel time' do
            response = MapService.get_route("Charlotte, NC", "Galveston, TX")

            expect(response).to be_a(Hash)
            expect(response[:route]).to be_a(Hash)
        end
    end
end
