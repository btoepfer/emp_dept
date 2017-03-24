class Department < ApplicationRecord
  has_many :employees, :dependent => :delete_all
end
