require 'rails_helper'

RSpec.describe 'Photo Service' do
    describe 'photo based on location', :vcr do
        it 'can return a picture based on location search' do
            response = PhotoService.get_photo("auburn, al")

            expect(response).to be_a(Hash)
            expect(response).to have_key(:results)
        end
    end
end