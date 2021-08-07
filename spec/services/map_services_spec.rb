require 'rails_helper'

RSpec.describe 'Map Service' do 
    describe 'happy path' do
        it 'it can get latitude and longitude from a city' do
            location = MapFacade.get_lat_long("charlotte, nc")

            expect(response).to be_successful
            expect(response.count).to eq(1)
        end
    end
end