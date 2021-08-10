class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email

  set_type :users
end
