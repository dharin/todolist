class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]
  before_action :find_user

  def create
    @item =  Item.create(item_params)
    respond_to do |format|
      format.js
      format.html { redirect_to user_path(@user.id) }
    end 
  end

  def update
    @item = Item.find_by(id: params[:id])
    @item.state = !@item.state
    @item.save!
    respond_to do |format|
      format.js 
      format.html { redirect_to user_path(@user.id) }
    end 
  end

  private

  def item_params
    params.require(:item).permit(:list_id, :title, :state)
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end
end
