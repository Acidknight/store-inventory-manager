class InventoryListsController < ApplicationController

    def index
        if params[:i]
            @inventory_lists = InventoryList.search(params[:i])
        else
            @inventory_lists = InventoryList.alpha.ApplicationController
        end
    end
end
