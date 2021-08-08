require 'rails_helper'

RSpec.describe 'Map Service' do 
    describe 'latitude and longitude' do
        it 'can get latitude and longitude from a city' do
            response = MapService.get_address("Charlotte,NC")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng]).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(35.222936)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-80.840161)
        end

        it 'can get latitude and longitude from a two-worded city' do
            response = MapService.get_address("San Francisco,CA")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(37.78008)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-122.420168)
        end

        it 'can get latitude and longitude from a three-worded city' do
            response = MapService.get_address("New York City,NY")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(40.713054)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-74.007228)
        end

        it 'can get latitude and longitude from a mispelled city' do
            response = MapService.get_address("Springfeild,IL")

            expect(response).to be_a(Hash)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lat]).to eq(39.79936)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
            expect(response[:results][0][:locations][0][:latLng][:lng]).to eq(-89.643624)
        end
    end
end
