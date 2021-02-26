class InventoryListsController < ApplicationController

    def index
        if params[:i]
            @inventory_lists = InventoryList.search(params[:i])
        else
            @inventory_lists = InventoryList.alpha.ApplicationController
        end
    end

    def new
        @inventory_list = InventoryList.new
    end

    def create 
        @inventory_list = current_user.inventory_lists.build(inventory_lists_params)
        if @inventory_list.save 
            redirect_to inventory_list_path(@inventory_list)
        else 
            render new
        end
    end

    private 

    def inventory_lists_params
        params.require(:inventory_list).permit(:name, :item_count, :date, :time, :list_content)
    end
end
