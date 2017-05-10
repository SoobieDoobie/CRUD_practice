class PostsController < ApplicationController
    
    def diary
        @posts = Post.all.reverse
    end
    
    def new
    end
    
    def edit
        @posts = Post.find(params[:post_id])
    end
    
    def create
        post = Post.new
        post.title = params[:title]
        post.content = params[:content]
        post.username = params[:username]
        post.save
        
        redirect_to '/diary'
    end
    
    def update
        post = Post.find(params[:post_id])
        post.title = params[:title]
        post.content = params[:content]
        post.username = params[:username]
        post.save
        
        redirect_to '/diary'
    end
    
    def delete
        delete_post = Post.find(params[:post_id])
        delete_post.delete
        redirect_to '/diary'
    end
end
