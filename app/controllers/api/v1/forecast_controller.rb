class Api::V1::ForecastController < ApplicationController
    def index
        if params[:location]
            location = MapFacade.get_lat_long(params[:location])
            weather = ForecastFacade.get_hourly_daily_current_weather(location.lat, location.lng)
            render json: ForecastSerializer.new(weather)
        else
            render json: { errors: 'No location given' }, status: :bad_request
        end
    end
end