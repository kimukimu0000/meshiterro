class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]

  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_current_user, only: [:edit, :update]

  def new
  @user = User.new
end

def create
  @user = User.new(user_params)

  if @user.save
    redirect_to new_session_path,
                notice: "ユーザー登録が完了しました！続けてログインしてください。"
  else
    render :new, status: :unprocessable_entity
  end
end

  def show
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_current_user
    unless @user == Current.user
      redirect_to post_images_path,
                  alert: "ほかのユーザーのプロフィールは編集できません。"
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email_address,
      :password,
      :password_confirmation,
      :profile_image
    )
  end
end