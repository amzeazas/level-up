class QuestsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @quests = @user.quests.order(name: :asc)
  end

  def show
    @quest = Quest.find(params[:id])
    @user = @quest.user
  end

  def new
    @user = User.find(params[:user_id])
    @quest = @user.quests.new
  end

  def create
    @user = User.find(params[:user_id])
    @quest = @user.quests.new(quest_params)
    if @quest.save
      respond_to do |format|
        format.html { redirect_to user_quests_path(@user) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @quest = Quest.find(params[:id])
    @user = @quest.user
    render :edit
  end

  def update
    @quest = Quest.find(params[:id])
    @user = @quest.user
    if @quest.update(quest_params)
      respond_to do |format|
          format.html { redirect_to quest_path(@quest) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @quest = Quest.find(params[:id])
    @user = @quest.user
    @quest.missions.each do |mission|
      mission.destroy
    end
    @quest.destroy
    redirect_to user_quests_path(@user)
  end

  private

  def quest_params
    params.require(:quest).permit(:name)
  end
end
