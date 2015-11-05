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

  private

  def mission_params
    params.require(:mission).permit(:description)
  end
end
