require 'rails_helper'

RSpec.describe 'Routes Poro' do
    describe 'it instantiates and returns route' do
        it 'can take data and return an object' do
            route_data = {
                formattedTime: "00:16:43",
                locations: [
                    {
                        :adminArea5=>"Charlotte",
                        :adminArea3=>"NC"
                    },
                    {
                        :adminArea5=>"Huntersville",
                        :adminArea3=>"NC"
                    }
                ]
            }
            forecast = MapFacade.get_ending_destination_forecast("Huntersville, NC")
            route = Route.new(route_data, forecast)
            
            expect(route).to be_a(Route)
            expect(route.id).to be_nil
            expect(route.start_city).to be_a(String)
            expect(route.end_city).to be_a(String)
            expect(route.travel_time).to be_a(String)
            expect(route.weather_at_eta).to be_a(Hash)
            end
        end
    end