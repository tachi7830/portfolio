class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :mail_check]
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.page(params[:page]).per(5).order("id DESC")
    if user_signed_in?
      @favourites = Favourite.where(user_id: current_user.id).page(params[:page]).per(5).order("id DESC")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    prev_email = user.email
    if user.update(user_params)
      now_email = params[:user][:email]
      if prev_email == now_email
        flash[:notice] = "プロフィール更新しました！"
        redirect_to user_path(user.id)
      else
        redirect_to mail_check_path
      end
    else
      flash[:notice] = "プロフィール更新失敗しました！"
      render "edit"
    end
  end

  def mail_check
  end


  private

  def user_params
    params.require(:user).permit(:name, :image, :email )
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end

