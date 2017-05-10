class CommentsController < ApplicationController
    
    def create
        comment = Comment.new
        comment.content = params[:content]
        comment.post_id = params[:post_id]
        comment.save
        
        redirect_to '/diary'
    end
    
    def delete
        delete_comment = Comment.find(params[:id])
        delete_comment.delete
        redirect_to '/diary'
    end
end
