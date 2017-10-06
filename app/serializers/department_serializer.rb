class DepartmentSerializer < ActiveModel::Serializer

  type "departments"
  link(:self) { department_url(object) }
  attributes :dname, :loc

  has_many :employees do
    include_data true
    link(:related) { department_employees_url(object.id) }
  end

end
