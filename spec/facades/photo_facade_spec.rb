require 'rails_helper'

RSpec.describe 'Photos Facade' do
    describe 'photos facade', :vcr do
        it 'can return a photos object' do
            response = PhotoFacade.get_photo("charlotte,nc")

            expect(response).to be_a(Photo)
            expect(response.id).to be_nil
            expect(response.image).to be_a(Hash)
        end
    end
end