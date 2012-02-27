class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :client
      t.date :tododate

      t.timestamps
    end
    add_index :tasks, :client_id
  end
end
