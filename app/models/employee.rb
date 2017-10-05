class Employee < ApplicationRecord
  belongs_to :department

  has_many :subordinates, class_name: :Employee, foreign_key: :mgr, primary_key: :empno

  belongs_to :manager, class_name: :Employee, foreign_key: :mgr, primary_key: :empno, optional: true
  
end
