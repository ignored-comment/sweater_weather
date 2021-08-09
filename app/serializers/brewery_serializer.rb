class BrewerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :breweries, :forecast

  set_type :forecast
end
