class CommentsController < ApplicationController
  before_action :authenticate_user! # make sure user is signed in 
  
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(params[:comment].permit(:content)) # create comment 
    @comment.user_id = current_user.id # assign comment user id to comment id 
    @comment.post_id = @post.id  # assign the post id to the post id 

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
end
