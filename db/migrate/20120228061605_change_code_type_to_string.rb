class ChangeCodeTypeToString < ActiveRecord::Migration
  def up
    change_column :agents, :code, :string
  end

  def down
  end
end
