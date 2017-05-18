class PostsController < ApplicationController
  def index
    if session[:current_user].nil?
      return redirect_to '/users'
    end
    @posts = Post.all
    @comments = Comment.all

    # @posts = Post.includes(:comments)
    # OR EVEN BETTER
    # @posts = Post.includes(comments: [:user])  # this includes the user for each comment
  end

  def create
    if session[:current_user].nil?
      return redirect_to '/users'
    end
    @user = User.find(session[:current_user])
    @post=@user.posts.new(message:params[:message])  # Good use of `has_many` helpers
    if !@post.valid?
      flash[:errors] = @post.errors.full_messages
      redirect_to '/posts'
    else
      @post=@user.posts.create(message:params[:message])
      redirect_to '/posts'
    end
    
  end
  
end
