require 'rails_helper'

RSpec.describe 'Brewery Index' do
    describe 'happy paths' do
        it 'can get the breweries, weather, and destination for a city' do
            get '/api/v1/brewery', params: {location: "galveston,tx", quantity: 2}
            brewery = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)
            expect(brewery).to be_a(Hash)
            expect(brewery[:data][:attributes]).to have_key(:destination)
            expect(brewery[:data][:attributes]).to have_key(:forecast)
            expect(brewery[:data][:attributes]).to have_key(:breweries)

            expect(brewery[:data][:attributes][:destination]).to eq("galveston,tx")
            expect(brewery[:data][:attributes][:destination]).to eq("galveston,tx")

            expect(brewery[:data][:attributes][:forecast]).to have_key(:summary)
            expect(brewery[:data][:attributes][:forecast]).to have_key(:temperature)

            expect(brewery[:data][:attributes][:breweries].count).to eq(2)
            expect(brewery[:data][:attributes][:breweries].first).to have_key(:id)
            expect(brewery[:data][:attributes][:breweries].first).to have_key(:name)
            expect(brewery[:data][:attributes][:breweries].first).to have_key(:brewery_type)
        end
    end

    describe 'sad paths' do
        it 'can return an error for not including a city and state in params' do
            get '/api/v1/brewery'
            expect(response.body).to eq("{\"errors\":\"No location given\"}")
            expect(response.status).to eq(400)
        end
    end
end