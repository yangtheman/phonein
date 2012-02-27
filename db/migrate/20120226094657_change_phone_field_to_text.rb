class ChangePhoneFieldToText < ActiveRecord::Migration
  def up
    change_column :clients, :phone, :text
  end

  def down
  end
end
