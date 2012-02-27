class ChangeCurrentToStatePairs < ActiveRecord::Migration
  def up
    rename_column :pairs, :current, :state
    change_column :pairs, :state, :string
  end

  def down
  end
end
