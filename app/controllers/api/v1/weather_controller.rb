class Api::V1::WeatherController < ApplicationController
    def index
        location = MapFacade.get_lat_long(params[:location])
    end
end