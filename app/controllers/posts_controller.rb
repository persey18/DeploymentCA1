class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] # reroute to sign page if user isnt a member and trys to post 
  def index 
    @posts = Post.all.order("created_at DESC")
   end
   
   def show 
    @comments = Comment.where(post_id: @post) # find the comment associated with that post 
   end
   
   def new 
     @post = current_user.posts.build
   end
   
   def create 
     @post = current_user.posts.build(post_params) #makes sure the user id column is filled in
     if @post.save
      redirect_to @post #redirect to post if it can be saved 
    else
      render 'new'
   end
  end 
   def edit 
   end
   
   def update
     if @post.update(post_params) 
       redirect_to @post
     else
       render 'edit'
     end
   end
   
   def destroy
     @post.destroy
     redirect_to root_path
   end
   
   def find_post
     @post = Post.find(params[:id])
     #grab post
   end
   
   def post_params
   params.require(:post).permit(:title, :contact, :description, :image) #define what the post params are 
   end
end
