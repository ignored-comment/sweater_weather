require 'rails_helper'

RSpec.describe '' do
    describe 'Happy Paths' do
        xit 'can get weather for a city' do
            get '/api/v1/weather', params: {location: "denver, co"}

            forecast = JSON.parse(response.body, symbolize_names: true)

            expect(response).to be_successful
        end
    end
end