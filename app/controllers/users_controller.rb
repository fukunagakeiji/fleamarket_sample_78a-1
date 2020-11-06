class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.where(user_id: current_user.id)
    @item = Item.where(seller_id: current_user.id).order("created_at DESC").limit(3)
  end
end
