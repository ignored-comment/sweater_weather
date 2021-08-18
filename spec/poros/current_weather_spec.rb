require 'rails_helper'

RSpec.describe 'Current Weather Poro' do
    describe 'it can encapsulate and retrieve information' do
        it 'can take data and encapsulate it' do
            beijing_current_weather = {
                :dt=>1628454385,
                :sunrise=>1628457617,
                :sunset=>1628507985,
                :temp=>71.47,
                :feels_like=>72.46,
                :pressure=>1005,
                :humidity=>88,
                :dew_point=>67.73,
                :uvi=>0,
                :clouds=>97,
                :visibility=>10000,
                :wind_speed=>3.27,
                :wind_deg=>341,
                :wind_gust=>7.76,
                :weather=>
                [{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10n"}],
                :rain=>{:"1h"=>0.53}
            }
            poro = CurrentWeather.new(beijing_current_weather)

            expect(poro.datetime).to be_a(String)
            expect(poro.conditions).to be_a(String)
            expect(poro.conditions).to eq('light rain')
            expect(poro.feels_like).to be_a(Float)
            expect(poro.feels_like).to eq(72.46)
            expect(poro.sunrise).to be_a(String)
            expect(poro.sunset).to be_a(String)
            expect(poro.uvi).to be_a(Integer).or be_a(Float)
            expect(poro.uvi).to eq(0)
            expect(poro.visibility).to be_a(Integer).or be_a(Float)
            expect(poro.visibility).to eq(10000)
        end
    end
end