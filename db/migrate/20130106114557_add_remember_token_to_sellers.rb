class AddRememberTokenToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :remember_token, :string
    add_index :sellers, :remember_token
  end
end
