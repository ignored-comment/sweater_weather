require 'rails_helper'

RSpec.describe 'Road Trip Create' do
    describe 'happy paths' do
        it 'can create a roadtrip' do
            @user = User.create(email: "lmaonnaise@mayo.com", password: "lmaowhat", password_confirmation: "lmaowhat", api_key: "309jlxjhznbdfro4387636fjwiv")

            headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }

            body = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "309jlxjhznbdfro4387636fjwiv"
            }

            post '/api/v1/road_trip', headers: headers, params: body.to_json

            road_trip = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)

            expect(road_trip).to have_key(:data)
            expect(road_trip[:data]).to have_key(:id)
            expect(road_trip[:data]).to have_key(:type)
            expect(road_trip[:data]).to have_key(:attributes)

            expect(road_trip[:data][:attributes]).to have_key(:start_city)
            expect(road_trip[:data][:attributes]).to have_key(:end_city)
            expect(road_trip[:data][:attributes]).to have_key(:travel_time)
            expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)

            expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
            expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
        end
    end

    describe 'sad paths' do
        it 'can create return an error for invalid api key' do
            @user = User.create(email: "lmaonnaise@mayo.com", password: "lmaowhat", password_confirmation: "lmaowhat", api_key: "309jlxjhznbdfro4387636fjwiv")

            headers = {
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            }

            body = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "dead_inside"
            }

            post '/api/v1/road_trip', headers: headers, params: body.to_json

            road_trip = JSON.parse(response.body, symbolize_names: true)

            expect(response.body).to eq("{\"errors\":\"API key invalid\"}")
            expect(response.status).to eq(401)
        end
    end
end