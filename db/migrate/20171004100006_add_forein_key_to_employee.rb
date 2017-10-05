class AddForeinKeyToEmployee < ActiveRecord::Migration[5.1]
  def change
    #add_column :employees, :mgr, :integer  #bereits vorhanden
    add_foreign_key :employees, :employees, column: :mgr, primary_key: :empno
    add_index :employees, :mgr
  end
end
