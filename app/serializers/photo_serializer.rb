class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image

  set_type :image
end
