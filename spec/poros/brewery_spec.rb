require 'rails_helper'

RSpec.describe 'Brewery Poro' do
    describe 'it can encapsulate and retrieve information' do
        it 'can take data and encapsulate it' do
            city_state = "Houston, TX"
            location = MapFacade.get_lat_long(city_state)
            array_of_lat_lng = [location.lat, location.lng]
            forecast = BreweryFacade.get_weather(array_of_lat_lng)
            
            breweries = [
                {:id=>8204, :name=>"8th Wonder Brewery", :brewery_type=>"micro"},
                {:id=>14075, :name=>"Saint Arnold Brewing Co", :brewery_type=>"regional"},
                {:id=>14308, :name=>"Sigma Brewing Company", :brewery_type=>"micro"}
            ]

            houston = Brewery.new(city_state, breweries, forecast)

            expect(houston.id).to be_nil
            expect(houston.breweries).to be_a(Array)
            expect(houston.destination).to be_a(String)
            expect(houston.forecast).to be_a(Hash)
        end
    end
end