class Api::V1::StoresController < ApplicationController
    def index
        @stores = Store.all
    
        stores_json = StoreSerializer.new(@stores).serialized_json
        render json: stores_json
      end

      def show
        store_json = StoreSerializer.new(@store).serialized_json
        render json: store_json
      end
end
