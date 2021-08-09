class BrewerySerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination, :forecast, :breweries

  set_type :forecast
end
