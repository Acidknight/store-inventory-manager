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

    def index
        if params[:name]
            @items = Item.search_by_name(params[:name]).order_by_name
            @items = Item.order_by_name if @items == []
        else
            @items = Item.order_by_name
        end
    end

    def show
        set_item
    end

    def edit
        set_item
    end

    private

    def set_item
        @item = Item.find_by(id: params[:id])
        if !@item
            redirect_to items_path
        end
    end

    def item_params
        params.require(:item).permit(:name, :category, :quantity, :location)
    end

end
