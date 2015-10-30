class ChangeCategoriesToQuests < ActiveRecord::Migration
  def change
    rename_table :categories, :quests
  end
end
