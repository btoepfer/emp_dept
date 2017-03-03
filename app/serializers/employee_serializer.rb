class EmployeeSerializer < ActiveModel::Serializer
  attributes :empno, :ename, :job, :hiredate, :sal, :comm
  #belongs_to :department
  link(:self)  { department_employee_url(object.department_id, object.id)}
end
