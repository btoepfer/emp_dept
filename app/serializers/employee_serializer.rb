class EmployeeSerializer < ActiveModel::Serializer
  attributes :empno, :ename, :job, :hiredate, :sal, :mgr
  belongs_to :department
  has_many   :subordinates
  belongs_to :manager
  link(:self)  { department_employee_url(object.department_id, object.id)}
end
