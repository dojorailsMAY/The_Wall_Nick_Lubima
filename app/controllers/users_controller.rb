class UsersController < ApplicationController
  def index
  end

  def login
    @user = User.find_by(user_params)
    if @user
      session[:current_user] = @user.id
      session[:current_user_name] = @user.username
      redirect_to '/posts'
    else
      flash[:errors] = ["User not found. Please, register!"]
      redirect_to "/users"
    end
  end

  def logout
    reset_session
    redirect_to '/users'
  end

  def create
    @user = User.new(user_params)
    if !@user.valid?
      flash[:errors] = @user.errors.full_messages
      if params[:password] != params[:confirm_password] 
        if flash[:errors]
          flash[:errors].concat(["Passwords don't match!"])
        else
          flash[:errors] = ["Passwords don't match!"]
        end
        redirect_to '/users'
      else
        @user = User.create(user_params)
        session[:current_user] = @user.id
        session[:current_user_name] = @user.username
        redirect_to '/posts'
      end
      
    end
    
  end

private

  def user_params
    params.require(:user).permit(:username,:password)
  end
end
