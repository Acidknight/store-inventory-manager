class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
   
    def index
        if params[:list_id] && @inventory_list = InventoryList.find_by_id(params[:list_id])
            @comments = @inventory_list.comments
        elsif current_user
            @comments = current_user.comments.all
        else
            @error = "Inventory List doesn't exist" if params[:list_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:list_id] && @inventory_list = InventoryList.find_by_id(params[:list_id])
            @comment = @inventory_list.comments.new
            
        else
            @error = "Inventory List doesn't exist" if params[:list_id]
            @comment = Comment.new
        end
    end

    def create
        @inventory_list = InventoryList.find(params[:comment][:list_id])
        @comment = current_user.comments.new(comment_params)
        
        if @comment.save
            redirect_to inventory_list_comment_path(@inventory_list, @comment)
        else
            @error = @comment.errors.full_messages
            render :new
        end
    end
end
