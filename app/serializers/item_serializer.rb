class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :store_id ,:name, :price, :description, :condition, :image_url
end
