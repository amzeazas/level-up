class ChangeCompleteToCompleted < ActiveRecord::Migration
  def change
    rename_column :missions, :complete?, :completed?
  end
end
