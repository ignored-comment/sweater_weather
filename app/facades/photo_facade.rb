class PhotoFacade
    class << self
        def get_photo(city_state)
            json = PhotoService.get_photo(city_state)
            Photo.new(city_state, json)
        end
    end
end