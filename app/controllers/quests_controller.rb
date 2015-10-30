class QuestsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @quests = @user.quests
  end
end
