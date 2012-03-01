class ChangePhoneFieldToString < ActiveRecord::Migration
  def up
    change_column :clients, :phone, :string
  end

  def down
  end
end
