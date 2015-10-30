class ChangeCategoryIdToQuestId < ActiveRecord::Migration
  def change
    rename_column :missions, :category_id, :quest_id
  end
end
