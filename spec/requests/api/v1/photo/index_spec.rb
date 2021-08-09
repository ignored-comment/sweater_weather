require 'rails_helper'

RSpec.describe 'Forecast Index' do
    describe 'happy paths', :vcr do
        it 'can get the weather for a city' do
            get '/api/v1/backgrounds', params: {location: "galveston,tx"}
            photo = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)
            expect(photo).to be_a(Hash)

            expect(photo).to have_key(:data)
            expect(photo[:data]).to have_key(:id)
            expect(photo[:data]).to have_key(:type)
            expect(photo[:data]).to have_key(:attributes)

            expect(photo[:data][:attributes]).to have_key(:image)
            expect(photo[:data][:attributes][:image]).to have_key(:location)
            expect(photo[:data][:attributes][:image]).to have_key(:image_url)
            expect(photo[:data][:attributes][:image]).to have_key(:credit)

            expect(photo[:data][:attributes][:image][:image_url]).to have_key(:raw)
            expect(photo[:data][:attributes][:image][:image_url]).to have_key(:full)
            expect(photo[:data][:attributes][:image][:image_url]).to have_key(:regular)
            expect(photo[:data][:attributes][:image][:image_url]).to have_key(:small)
            expect(photo[:data][:attributes][:image][:image_url]).to have_key(:thumb)

            expect(photo[:data][:attributes][:image][:credit]).to have_key(:source)
            expect(photo[:data][:attributes][:image][:credit]).to have_key(:author)
            expect(photo[:data][:attributes][:image][:credit]).to have_key(:logo)

            expect(photo[:data][:attributes][:image][:credit][:logo]).to have_key(:small)
            expect(photo[:data][:attributes][:image][:credit][:logo]).to have_key(:medium)
            expect(photo[:data][:attributes][:image][:credit][:logo]).to have_key(:large)

            expect(photo[:data]).to_not have_key(:total_pages)
            expect(photo[:data]).to_not have_key(:total)
            expect(photo[:data]).to_not have_key(:categories)
            expect(photo[:data]).to_not have_key(:current_user_collections)
            expect(photo[:data]).to_not have_key(:sponsorship)
            expect(photo[:data]).to_not have_key(:user)
        end
    end

    describe 'sad paths' do
        it 'can return an error for not including a city and state in params' do
            get '/api/v1/backgrounds'
            expect(response.body).to eq("{\"errors\":\"No location given\"}")
            expect(response.status).to eq(400)
        end
    end
end