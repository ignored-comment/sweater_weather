class Api::V1::RoadTripController < ApplicationController
    def create
        user = User.find_by(api_key: params[:api_key])
        if user
            road_trip = MapFacade.get_route(params[:origin], params[:destination])
            render json: RoadtripSerializer.new(road_trip)
        else
            render json: { errors: "API key invalid" }, status: :unauthorized
        end
    end
end