require 'rails_helper'

RSpec.describe 'Current Weather Poro' do
    describe 'it can encapsulate and retrieve information' do
        it 'can take data and encapsulate it' do
            beijing_hourly_weather = {
                :dt=>1628456400,
                :temp=>71.49,
                :feels_like=>72.48,
                :pressure=>1005,
                :humidity=>88,
                :dew_point=>67.75,
                :uvi=>0,
                :clouds=>61,
                :visibility=>10000,
                :wind_speed=>2.17,
                :wind_deg=>357,
                :wind_gust=>3.29,
                :weather=>[{:id=>803, :main=>"Clouds", :description=>"broken clouds", :icon=>"04n"}],
                :pop=>0.2
            }
            poro = HourlyWeather.new(beijing_hourly_weather)

            expect(poro.date_time).to be_a(String)
            expect(poro.date_time).to eq("2021-08-08 17:00:00 -0400")
            expect(poro.temp).to be_a(Float)
            expect(poro.temp).to eq(71.49)
            expect(poro.conditions).to be_a(String)
            expect(poro.conditions).to eq("broken clouds")
            expect(poro.icon).to be_a(String)
            expect(poro.icon).to eq("04n")
        end
    end
end