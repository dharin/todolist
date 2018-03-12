class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    unless user.present?
      user = User.create(email: params[:user][:email])
    end
    redirect_to user_lists_path(user.id)
  end
end
