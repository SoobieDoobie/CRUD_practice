class PostsController < ApplicationController
    
    before_action :authenticate_user!, except: [:diary]
    
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
        post.user_id = current_user.id
        
        uploader = BrisbaneUploader.new
        uploader.store!(params[:image_file])
        
        post.image_url = uploader.url
        post.thumb_image_url = uploader.thumb.url
        
        
            
        if post.save
            # flash[:error] = 'Post has been successfully!'
            # redirect_to '/diary'
        else
            messages = []
            post.errors.messages.each_with_index do |msg, idx|
                messages.push(msg[1][0])
            end
            
            @messages = messages.join('\n')
           # flash[:error] = post.errors.messages[:title][0]
           # render 'new'
        end
        respond_to do |format|
            format.js
        end
    end
    
    def update
        post = Post.find(params[:post_id])
        post.title = params[:title]
        post.content = params[:content]
        post.save
    end
    
    def delete
        delete_post = Post.find(params[:post_id])
        delete_post.delete
        redirect_to '/diary'
    end
end
