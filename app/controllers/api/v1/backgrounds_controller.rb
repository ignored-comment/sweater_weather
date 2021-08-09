class Api::V1::BackgroundsController < ApplicationController
    def index
        if params[:location]
            photo = PhotoFacade.get_photo(params[:location])
            render json: BackgroundsSerializer.new(photo)
        else
            render json: { errors: 'No location given' }, status: :bad_request
        end
    end
end