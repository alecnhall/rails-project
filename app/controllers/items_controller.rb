class ItemsController < ApplicationController

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
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        @item.save
        redirect_to root_url
    end

    private

    def item_params
        params.require(:item).permit(
            :name,
            :amount
        )
    end
end
