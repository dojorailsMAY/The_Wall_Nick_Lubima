class CommentsController < ApplicationController
  def create
    @user = User.find(session[:current_user])
    @comment=@user.comments.new(message:params[:message],post:Post.find(params[:post_id]))
    if !@comment.valid?
      flash[:errors] = @comment.errors.full_messages
      redirect_to '/posts'
    else
      @comment=@user.comments.create(message:params[:message],post:Post.find(params[:post_id]))
      redirect_to '/posts'
    end
  end
end
