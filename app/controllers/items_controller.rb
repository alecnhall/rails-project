class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create 
        @item = Item.create(item_params)
        @item.pantry_id = current_user.pantry.id
        @item.save
        redirect_to user_path(current_user.id)
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.update(item_params)
        redirect_to user_path(current_user.id)
    end

    private

    def item_params
        params.require(:item).permit(
            :name,
            :amount
        )
    end
end
