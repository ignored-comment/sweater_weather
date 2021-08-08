require 'rails_helper'

RSpec.describe 'Forecast Index' do
    describe 'happy paths' do
        it 'can get the weather for a city' do
            get '/api/v1/forecast', params: {location: "galveston,tx"}
            forecast = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
            expect(response.status).to eq(200)
            expect(forecast).to be_a(Hash)
            expect(forecast[:data][:attributes].count).to eq(3)
            expect(forecast[:data][:attributes]).to have_key(:current_weather)
            expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
            expect(forecast[:data][:attributes]).to have_key(:daily_weather)

            expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:temp)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:uvi)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:visibility)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:conditions)
            expect(forecast[:data][:attributes][:current_weather]).to have_key(:icon)

            expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:pressure)
            expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:dew_point)
            expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_speed)
            expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_deg)
            expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:wind_gust)
            expect(forecast[:data][:attributes][:current_weather]).to_not have_key(:dt)

            expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:datetime)
            expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:temp)
            expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:conditions)
            expect(forecast[:data][:attributes][:hourly_weather].first).to have_key(:icon)

            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:dt)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:pressure)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:humidity)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:uvi)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:dew_point)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:clouds)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:visibility)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_gust)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_deg)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:wind_speed)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:weather)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:pop)
            expect(forecast[:data][:attributes][:hourly_weather].first).to_not have_key(:rain)

            expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:icon)
            expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:datetime)
            expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunrise)
            expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:sunset)
            expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:max_temp)
            expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:min_temp)
            expect(forecast[:data][:attributes][:daily_weather].first).to have_key(:conditions)

            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:dt)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:moonrise)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:moonset)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:temp)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:moonphase)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:feels_like)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:pressure)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:humidity)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:dew_point)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:wind_speed)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:wind_deg)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:wind_gust)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:weather)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:clouds)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:pop)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:rain)
            expect(forecast[:data][:attributes][:daily_weather].first).to_not have_key(:uvi)
        end
    end

    describe 'sad paths' do
        it 'can return an error for not including a city and state in params' do
            get '/api/v1/forecast'
            expect(response.body).to eq("{\"errors\":\"No location given\"}")
            expect(response.status).to eq(400)
        end
    end
end