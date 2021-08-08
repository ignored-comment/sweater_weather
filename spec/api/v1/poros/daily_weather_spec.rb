require 'rails_helper'

RSpec.describe 'Current Weather Poro' do
    describe 'it can encapsulate and retrieve information' do
        it 'can take data and encapsulate it' do
            beijing_daily_weather = {
                :dt=>1628481600,
                :sunrise=>1628457617,
                :sunset=>1628507985,
                :moonrise=>1628458500,
                :moonset=>1628510880,
                :moon_phase=>0.02,
                :temp=>{:day=>88.05, :min=>70.41, :max=>90.07, :night=>70.41, :eve=>85.89, :morn=>71.55},
                :feels_like=>{:day=>90.77, :night=>71.33, :eve=>91.26, :morn=>72.48},
                :pressure=>1004,
                :humidity=>49,
                :dew_point=>66.54,
                :wind_speed=>10.29,
                :wind_deg=>176,
                :wind_gust=>18.07,
                :weather=>[{:id=>501, :main=>"Rain", :description=>"moderate rain", :icon=>"10d"}],
                :clouds=>2,
                :pop=>1,
                :rain=>9.52,
                :uvi=>7.39
            }
            poro = DailyWeather.new(beijing_daily_weather)

            expect(poro.date_time).to be_a(String)
            expect(poro.date_time).to eq("2021-08-09 00:00:00 -0400")
            expect(poro.sunrise).to be_a(String)
            expect(poro.sunrise).to eq("2021-08-08 17:20:17 -0400")
            expect(poro.sunset).to be_a(String)
            expect(poro.sunset).to eq("2021-08-09 07:19:45 -0400")
            expect(poro.max_temp).to be_a(Float)
            expect(poro.max_temp).to eq(90.07)
            expect(poro.min_temp).to be_a(Float)
            expect(poro.min_temp).to eq(70.41)
            expect(poro.conditions).to be_a(String)
            expect(poro.conditions).to eq("moderate rain")
            expect(poro.icon).to be_a(String)
            expect(poro.icon).to eq("10d")
        end
    end
end