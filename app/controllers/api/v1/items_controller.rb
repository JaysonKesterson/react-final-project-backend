class Api::V1::ItemsController < ApplicationController

  before_action :set_item, only: [:show, :update, :destroy]

  def index
      @items = Item.all
  
      items_json = ItemSerializer.new(@items).serialized_json
      render json: items_json
    end

    def create
      
      @item = Item.new(item_params)
      serialized_item = ItemSerializer.new(@item)
      if @item.save
        render json: serialized_item, status: :created
      else
        resp = {
          error: @item.errors.full_messages.to_sentence
        }
        render json: resp, status: :unprocessable_entity
      end
    end

    def show
      item_json = ItemSerializer.new(@item)
      render json: item_json
    end

    def update
      if @item.update(item_params)
        render json: ItemSerializer.new(@item)
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    def destroy

      if @item.destroy
        render json: { data: "Item successfully destroyed" }, status: :ok
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end

    def item_params
      params.require(:item).permit(:store_id, :name, :price, :image_url, :description, :condition)
    end

    private

    def set_item
      @item = Item.find(params[:id])
    end
end
