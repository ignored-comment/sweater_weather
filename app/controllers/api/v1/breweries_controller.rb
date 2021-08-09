class Api::V1::BreweriesController < ApplicationController
    def index
        if params[:location] && params[:quantity]
            location = MapFacade.get_lat_long(params[:location])
            brewery = BreweryFacade.get_city_current_weather_and_breweries(params[:location], [location.lat, location.lng], params[:quantity])
            render json: BrewerySerializer.new(brewery)
        else
            render json: { errors: 'No location given' }, status: :bad_request
        end
    end
end