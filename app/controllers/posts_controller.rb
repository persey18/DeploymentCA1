class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote] #Filters are methods that are run before, after or "around" a controller action. 
  before_action :authenticate_user!, except: [:index, :show] # reroute to sign page if user isnt a member and trys to post 
  
  
  def search 
  if params[:search].present?
    @posts = Post.search(params[:search]) #parameters are user specified data to rails application.
  else
    @posts = Post.all
  end
  end
  def index 
    @posts = Post.all.order("created_at DESC") #order posts in descending order from when they were created
   end
   
   def show # CRUD Functionality
    @comments = Comment.where(post_id: @post) # find the comment associated with that post (where post id is equal to current post  )
    @random_post = Post.where.not(id: @post).order("RANDOM()").first # allow a random post to be shown where 
   end                                                   #the post is NOT the same as the current post 
                                                         #order them and pick the first post 
   def new 
     @post = current_user.posts.build #make 
   end
   
   def create #parameters are user specified data to rails application.
     @post = current_user.posts.build(post_params) #makes sure the user id column is filled in when we create a post 
     if @post.save
      redirect_to @post #redirect to post show page if it can be saved 
    else
      render 'new' #else render new file 
   end
  end 
   def edit 
   end
   
   def update
     if @post.update(post_params) #parameters are user specified data to rails application.
       redirect_to @post #redirect to post 
     else
       render 'edit' # else render the edit form 
     end
   end
   
   def destroy
     @post.destroy
     redirect_to root_path # redirect to root path (home page)
   end
   def upvote 
     @post.upvote_by current_user #upvote by current user 
     redirect_to :back # go back 
   end
   
   def downvote
     @post.downvote_by current_user 
     redirect_to :back
   end
     
   def find_post
     @post = Post.find(params[:id]) #grab the current post 
     #grab post
   end
   
   def post_params
   params.require(:post).permit(:title, :contact, :description, :image) #define what the post params are 
   end
end
