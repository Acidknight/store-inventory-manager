class ItemsController < ApplicationController

    def new 
        @item = Item.new 
    end

    def create
        @item = Item.new(item_params(:name, :category, :quantity, :location))
        if @item.save 
            redirect_to item_path(@item)
        else
            render new
        end
    end
end
