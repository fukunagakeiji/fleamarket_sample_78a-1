class UsersController < ApplicationController
  #before_action :set_user, only: [:show]

  def show
    @user = User.where(user_id: current_user.id)
  end


end
