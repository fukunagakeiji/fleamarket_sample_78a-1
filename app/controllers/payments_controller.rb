class PaymentsController < ApplicationController
  before_action :authenticate_user!
  require 'payjp'

  def new
  end

  def create
  end
end
