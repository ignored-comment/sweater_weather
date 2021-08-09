class Api::V1::PhotoController < ApplicationController
    def index
        if params[:location]
            photo = PhotoFacade.get_photo(params[:location])
            render json: PhotoSerializer.new(photo)
        else
            render json: { errors: 'No location given' }, status: :bad_request
        end
    end
end