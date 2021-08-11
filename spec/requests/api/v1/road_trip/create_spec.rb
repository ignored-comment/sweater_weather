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
            expect(response).to eq(200)
        end
    end
end