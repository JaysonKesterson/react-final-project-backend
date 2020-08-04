class StoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :user_id, :name
end
