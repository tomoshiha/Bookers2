class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @user = current_user
    @users = User.all

  end

  def show
    @book = Book.new
    @user =  User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to (current_user) unless @user == current_user
  end
end
