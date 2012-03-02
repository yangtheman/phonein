class AddPhoneAndPiNtoAdmin < ActiveRecord::Migration
  def up
    add_column :admins, :phone, :string
    add_column :admins, :pin, :string
  end

  def down
    remove_column :admins, :phone
    remove_column :admins, :pin
  end
end
