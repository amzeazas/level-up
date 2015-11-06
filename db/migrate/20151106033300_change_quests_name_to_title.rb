class ChangeQuestsNameToTitle < ActiveRecord::Migration
  def change
    rename_column :quests, :name, :title
  end
end
