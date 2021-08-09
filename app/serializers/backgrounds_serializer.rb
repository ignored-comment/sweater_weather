class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :image

  set_type :image
end
