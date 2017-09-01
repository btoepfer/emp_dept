class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name, :null => false
      t.string :nickname
      t.string :email, :null => false
      t.string :password_digest, :null => false, :default => ""
      t.integer :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :role, :null => false, :default => "read-only" # alternativ: read-write | admin

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end