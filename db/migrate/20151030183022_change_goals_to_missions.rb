class ChangeGoalsToMissions < ActiveRecord::Migration
  def change
    rename_table :goals, :missions
  end
end
