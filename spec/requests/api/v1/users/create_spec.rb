require 'rails_helper'

RSpec.describe 'Users Create' do
    describe 'happy paths' do
        it 'can create a user' do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "johnjacobjingleheimerschmidtt@hisnameismyname.com",
                "password": "lollerskates",
                "password_confirmation": "lollerskates"
            }

            post '/api/v1/users', headers: headers, params: body.to_json
            user = JSON.parse(response.body, symbolize_names:true)

            expect(response).to be_successful
            expect(response.status).to eq(201)

            expect(user[:data]).to have_key(:id)
            expect(user[:data]).to have_key(:type)
            expect(user[:data]).to have_key(:attributes)

            expect(user[:data][:attributes]).to have_key(:email)
            
            expect(user[:data]).to_not have_key(:password)
            expect(user[:data]).to_not have_key(:password_confirmation)
        end
    end

    describe 'sad path' do
        it "it returns an error if password does not match" do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "johnjacobjingleheimerschmidtt@hisnameismyname.com",
                "password": "lollerskates",
                "password_confirmation": "skates"
            }

            post '/api/v1/users', headers: headers, params: body.to_json
            user = JSON.parse(response.body, symbolize_names:true)

            expect(response.body).to eq("{\"errors\":\"Cannot create a user\"}")
            expect(response.status).to eq(400)
        end

        it 'returns an error if email already exists' do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "johnjacobjingleheimerschmidtt@hisnameismyname.com",
                "password": "lollerskates",
                "password_confirmation": "lollerskates"
            }

            post '/api/v1/users', headers: headers, params: body.to_json
            user1 = JSON.parse(response.body, symbolize_names:true)

            expect(response).to be_successful
            expect(response.status).to eq(201)

            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "johnjacobjingleheimerschmidtt@hisnameismyname.com",
                "password": "asdfskates",
                "password_confirmation": "asdfskates"
            }

            post '/api/v1/users', headers: headers, params: body.to_json
            user2 = JSON.parse(response.body, symbolize_names:true)

            expect(response.body).to eq("{\"errors\":\"Cannot create a user\"}")
            expect(response.status).to eq(400)
        end
    end
end