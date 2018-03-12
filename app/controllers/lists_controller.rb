class ListsController < ApplicationController
  before_action :find_user

  def index
    @lists = @user.lists
    @done_items = []
    @undone_items = []
    set_items(@lists.first) if @lists.present?
    @list = @user.lists.new
  end

  def show
    @list = List.find_by(id: params[:id])
    set_items(@list)
    respond_to do |format|
      format.js
      format.html { redirect_to user_lists_path(@user.id) }
    end
  end

  def create
    @list = @user.lists.create(list_params)
    set_items(@list)
    respond_to do |format|
      format.js
      format.html { redirect_to user_lists_path(@user.id) }
    end 
  end

  private

  def list_params
    params.require(:list).permit(:name, :description, :user_id)
  end

  def find_user
    @user = User.find_by(id: params[:user_id])
  end

  def set_items(list)
    @done_items = list.items.done_items
    @undone_items = list.items.undone_items
  end
end
