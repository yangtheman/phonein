class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.references :client
      t.references :agent
      t.boolean :current

      t.timestamps
    end
    add_index :pairs, :client_id
    add_index :pairs, :agent_id
  end
end
