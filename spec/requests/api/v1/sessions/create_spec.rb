require 'rails_helper'

RSpec.describe 'Sessions Create' do
    before :each do
        @user = User.create(email: "yaaaaaassssss@yass.com", password: "lmaolol", password_confirmation: "lmaolol", api_key: "xFjOdjh183Hf938192a9qweoimn")
    end

    describe 'happy path' do
        it 'can create a session when a user logs in' do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "yaaaaaassssss@yass.com",
                "password": "lmaolol",
            }
            post '/api/v1/sessions', headers: headers, params: body.to_json
            session = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)

            expect(session[:data]).to have_key(:id)
            expect(session[:data]).to have_key(:type)
            expect(session[:data]).to have_key(:attributes)

            expect(session[:data][:attributes]).to have_key(:email)
            expect(session[:data][:attributes]).to have_key(:api_key)
            
            expect(session[:data]).to_not have_key(:password)
            expect(session[:data]).to_not have_key(:password_confirmation)
        end
    end

    describe 'sad paths' do
        it "can return an error for email that doesn't exist" do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "yaaaaaassssss@yass.com",
                "password": "NOPE",
            }
            post '/api/v1/sessions', headers: headers, params: body.to_json

            expect(response.body).to eq("{\"errors\":\"Password or email is incorrect\"}")
            expect(response.status).to eq(400)
        end

        it "can return an error for an incorrect password" do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "yaaaaaassssss@yass.com",
                "password": "lmaolo",
            }
            post '/api/v1/sessions', headers: headers, params: body.to_json

            expect(response.body).to eq("{\"errors\":\"Password or email is incorrect\"}")
            expect(response.status).to eq(400)
        end

        it 'can return an error for empty email field' do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "",
                "password": "lmaolol",
            }
            post '/api/v1/sessions', headers: headers, params: body.to_json

            expect(response.body).to eq("{\"errors\":\"Password or email is blank\"}")
            expect(response.status).to eq(401)
        end

        it 'can return an error for empty password field' do
            headers = {
                'Content-Type' => "application/json",
                'Accept' => "application/json"
            }
            body = {
                "email": "yaaaaaassssss@yass.com",
                "password": "",
            }
            post '/api/v1/sessions', headers: headers, params: body.to_json

            expect(response.body).to eq("{\"errors\":\"Password or email is blank\"}")
            expect(response.status).to eq(401)
        end
    end
end