class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|  
      t.string :dname, limit: 14
      t.string :loc, limit: 13
    end
    add_index :departments, :dname, :unique => true
  end
end
