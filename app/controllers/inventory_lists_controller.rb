class InventoryListsController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index
        if params[:q]
            @inventory_lists = InventoryList.search(params[:q])
        else
            @inventory_lists = InventoryList.alpha.all
        end
    end

    def new
        @inventory_list = InventoryList.new
    end

    def create 
        @inventory_list = current_user.inventory_lists.build(inventory_lists_params)
        if @inventory_list.save 
            redirect_to inventory_lists_path(@inventory_list)
        else 
            render :new
        end
    end

    def show
        @inventory_list = InventoryList.find_by_id(params[:id])
    end

    def edit 
        @inventory_list = InventoryList.find(params[:id])
    end

    def update
        @inventory_list = current_user.inventory_lists.find(params[:id])
        if @inventory_list.update(inventory_lists_params)
            redirect_to inventory_list_path(@inventory_list)
        else
            @error = @inventory_list.errors.full_messages
            render :edit 
        end
    end

    def destroy
        @inventory_list = current_user.inventory_lists.find(params[:id])
        if @inventory_list.destroy
            flash[:success] = "Your list was successfully deleted."
            redirect_to inventory_lists_path
        else
            @error = @inventory_list.errors.full_messages
            render :edit
        end
    end

    private 

    def inventory_lists_params
        params.require(:inventory_list).permit(:name, :item_count, :date, :time, :list_content)
    end
end
