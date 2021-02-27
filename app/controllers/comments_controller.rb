class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in
   
    def index
        if params[:inventory_list_id] && @inventory_list = InventoryList.find_by_id(params[:inventory_list_id])
            @comments = @inventory_list.comments
        elsif current_user
            @comments = current_user.comments.all
        else
            @error = "Inventory List doesn't exist" if params[:list_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:inventory_list_id] && @inventory_list = InventoryList.find_by_id(params[:inventory_list_id])
            @comment = @inventory_list.comments.new
            
        else
            @error = "Inventory List doesn't exist" if params[:inventory_list_id]
            @comment = Comment.new
        end
    end

    def create
        @inventory_list = InventoryList.find(params[:comment][:inventory_list_id])
        @comment = current_user.comments.new(comment_params)
        
        if @comment.save
            redirect_to inventory_list_comment_path(@inventory_list, @comment)
        else
            @error = @comment.errors.full_messages
            render :new
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = current_user.comments.find(params[:id])
     
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            @error = @comment.errors.full_messages
            render :edit
        end
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        if @comment.destroy
            flash[:success] = "Your comment was successfully deleted."
            redirect_to inventory_lists_path
        else
            @error = @comment.errors.full_messages
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :inventory_list_id, :user_id)
    end
end
