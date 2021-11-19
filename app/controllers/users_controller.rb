class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(5).order("id DESC")
    if user_signed_in?
      @favourites = Favourite.where(user_id: current_user.id).page(params[:page]).per(5).order("id DESC")
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :image, :email )
  end

end

