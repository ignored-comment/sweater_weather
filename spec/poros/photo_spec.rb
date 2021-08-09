require 'rails_helper'

RSpec.describe 'Photo Poro' do
    describe 'it can encapsulate and return data' do
        it 'can return data as an object' do
            data = {
                results: [
                    {
                    :location=>"charlotte,nc",
                    :image_url=>
                        {:raw=>"https://images.unsplash.com/photo-1588778261013-8ffdf6ecb604?ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxjaGFybG90dGUlMkNuY3xlbnwwfHx8fDE2Mjg1MzkxMzU&ixlib=rb-1.2.1",
                        :full=>
                            "https://images.unsplash.com/photo-1588778261013-8ffdf6ecb604?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxjaGFybG90dGUlMkNuY3xlbnwwfHx8fDE2Mjg1MzkxMzU&ixlib=rb-1.2.1&q=85",
                        :regular=>
                            "https://images.unsplash.com/photo-1588778261013-8ffdf6ecb604?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxjaGFybG90dGUlMkNuY3xlbnwwfHx8fDE2Mjg1MzkxMzU&ixlib=rb-1.2.1&q=80&w=1080",
                        :small=>
                            "https://images.unsplash.com/photo-1588778261013-8ffdf6ecb604?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxjaGFybG90dGUlMkNuY3xlbnwwfHx8fDE2Mjg1MzkxMzU&ixlib=rb-1.2.1&q=80&w=400",
                        :thumb=>
                            "https://images.unsplash.com/photo-1588778261013-8ffdf6ecb604?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTI1NDh8MHwxfHNlYXJjaHw3fHxjaGFybG90dGUlMkNuY3xlbnwwfHx8fDE2Mjg1MzkxMzU&ixlib=rb-1.2.1&q=80&w=200"},
                    :credit=>
                        {:source=>"unsplash.com",
                        :author=>"sickhews",
                        :logo=>
                            {:small=>"https://images.unsplash.com/profile-1548249255389-2d3ac2109b06?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                            :medium=>"https://images.unsplash.com/profile-1548249255389-2d3ac2109b06?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                            :large=>"https://images.unsplash.com/profile-1548249255389-2d3ac2109b06?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                            }
                        }
                    }
                ] 
            }
            charlotte_photo = Photo.new("charlotte,nc", data)

            expect(charlotte_photo).to be_a(Photo)
            expect(charlotte_photo.id).to be_nil
        end
    end
end