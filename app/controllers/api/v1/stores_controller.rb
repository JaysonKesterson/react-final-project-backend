class Api::V1::StoresController < ApplicationController

    before_action :set_store, only: [:show, :update, :destroy]

    def index
        @stores = Store.all
    
        stores_json = StoreSerializer.new(@stores).serialized_json
        render json: stores_json
      end

      def create
        @store = Store.new(store_params)
        @creator = User.find_by(id: params[:store][:user_id])
        if @creator.store
          render json: {
                error: "You already have a store. Use Profile to Add new Items to it!"
        }
        else
          serialized_store = StoreSerializer.new(@store)
            if @store.save
              render json: serialized_store, status: :created
            else
              resp = {
              error: @store.errors.full_messages.to_sentence
              }
              render json: resp, status: :unprocessable_entity
              end
        end
      end

      def show
        store_json = StoreSerializer.new(@store)
        render json: store_json
      end

      def update
        if @store.update(store_params)
          render json: StoreSerializer.new(@store)
        else
          render json: @store.errors, status: :unprocessable_entity
        end
      end

      def destroy
        if @store.destroy
          render json: { data: "Store successfully destroyed" }, status: :ok
        else
          render json: @store.errors, status: :unprocessable_entity
        end
      end

      def get_current_user_store
        @store = Store.all.find_by(user_id: current_user.id)

        render json: StoreSerializer.new(@store)
      end

      def store_params
        params.require(:store).permit(:name, :user_id)
      end


      private

      def set_store
        @store = Store.find(params[:id])
      end
end
