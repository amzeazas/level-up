class MissionsController < ApplicationController
  def new
    @quest = Quest.find(params[:quest_id])
    @mission = @quest.missions.new
  end

  def create
    @quest = Quest.find(params[:quest_id])
    @mission = @quest.missions.new(mission_params)
    if @mission.save
      respond_to do |format|
        format.html { redirect_to user_quests_path(current_user) }
        format.js
      end
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    @quest = @mission.quest
    @user = @quest.user
  end

  def update
    @mission = Mission.find(params[:id])
    @quest = @mission.quest
    @user = @quest.user
    if @mission.update(mission_params)
      respond_to do |format|
          format.html { redirect_to quest_path(@quest) }
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @quest = @mission.quest
    @user = @quest.user
    @mission.destroy
    redirect_to user_quest_path(@user, @quest)
  end

  private

  def mission_params
    params.require(:mission).permit(:description)
  end
end
