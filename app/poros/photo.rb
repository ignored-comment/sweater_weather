class Photo
    attr_reader :id

    def initialize(city_state, data)
        @id = nil
        @random_image = data[:results].sample
        @city_state = city_state.strip.downcase
    end

    def image
        {
            location: @city_state,
            image_url: @random_image[:urls],
            credit: {
                source: "unsplash.com",
                author: @random_image[:user][:username],
                logo:  @random_image[:user][:profile_image]
            }
        }
    end
end