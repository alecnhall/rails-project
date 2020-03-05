class ItemsController < ApplicationController
    before_action :set_item, only: [:edit, :update, :destroy]

    def new
        @item = Item.new
    end

    def create 
        @item = Item.create(item_params)
        @item.pantry_id = current_user.pantry.id
        @item.save
        redirect_to root_url
    end

    def edit
    
    end

    def update
        @item.update(item_params)
        @item.save
        redirect_to root_url
    end

    def destroy
        @item.destroy
        redirect_to root_url
    end

    private

    def item_params
        params.require(:item).permit(
            :name,
            :amount
        )
    end

    def set_item
        @item = Item.find(params[:id])
    end
end
