class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.string :value
      t.text :coment
      t.references :client

      t.timestamps
    end
    add_index :operations, :client_id
  end
end
