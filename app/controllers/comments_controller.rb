class CommentsController < ApplicationController
  before_action :authenticate_user! # make sure user is signed in 
  
  def create
    @post = Post.find(params[:post_id]) # find the post        
    @comment = Comment.create(params[:comment].permit(:content)) # creates new Comment to database using data of params[:comment].
    @comment.content = ProfanityChecker.swapProfanity(@comment.content) #loop through content of content for profane words and mute them
    @comment.user_id = current_user.id # assign comment user id to comment id 
    @comment.post_id = @post.id  # assign the post id to the post id 
    
    if @comment.save # if comment is saved redirect to the post 
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
  end

