class ItemsController < ApplicationController

    def new
        @item = Item.new(pantry_id: current_user.pantry.id)
    end

    def create 
        @item = Item.create(item_params)
        redirect_to user_path(current_user.id)
    end

    def edit
        @item = Item.find(params[:id])
    end

    private

    def item_params
        params.require(:item).permit(
            :name,
            :amount,
            :pantry_id
        )
    end
end
