class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
   
    def index
        if params[:inventory_list_id] && @inventory_list = InventoryList.find_by_id(params[:inventory_list_id])
            @comments = @inventory_list.comments
        elsif current_user
            @comments = current_user.comments.all
        else
            @error = "Inventory List doesn't exist" if params[:inventory_list]
            @comments = Comment.all
        end
    end
end
