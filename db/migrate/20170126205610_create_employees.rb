class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|                                         
      t.decimal :empno, null: false, precision: 5, scale: 0
      t.string :ename, limit: 10
      t.string :job, limit: 9
      t.decimal :mgr, precision: 4, scale: 0
      t.date   :hiredate
      t.decimal :sal, precision: 7, scale: 2
      t.decimal :comm, precision: 7, scale: 2
      t.references :department, null: false, foreign_key: true, index:true
    end
    add_index :employees, :empno, :unique => true
  end
end
