class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :balance
  has_one :store, serializer: StoreSerializer
end
