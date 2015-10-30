class QuestsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @quests = @user.quests
  end

  def new
    @user = User.find(params[:user_id])
    @quest = @user.quests.new
    render :new
  end

  def create
    @user = User.find(params[:user_id])
    @quest = @user.quests.new(quest_params)
    if @quest.save
      flash[:notice] = "Quest successfully saved"
      respond_to do |format|
        format.html { redirect_to user_quests_path(@user) }
        format.js
      end
    else
      render :new
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:name)
  end
end
