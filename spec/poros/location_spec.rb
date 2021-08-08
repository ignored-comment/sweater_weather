require 'rails_helper'

RSpec.describe 'Location Object' do
    describe 'it instantiates and returns location' do
        it 'can take locations and return an object' do
           location = {
            "lat": 53.34347,
            "lng": -1.38213
            }
            sheffield = Location.new(location)
            
            expect(sheffield.lat).to eq(53.34347)
            expect(sheffield.lng).to eq(-1.38213) 
        end
    end
end