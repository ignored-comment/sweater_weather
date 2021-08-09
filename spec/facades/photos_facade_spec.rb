require 'rails_helper'

RSpec.describe 'Photos Facade' do
    describe 'photos facade' do
        it 'can return a photos object' do
            response = PhotosFacade.get_photo("charlotte,nc")

            expect(response).to be_a(Photo)
        end
    end
end