class EmployeesController < ApplicationController
  before_action :set_department, only: [:index, :show, :update]
  before_action :set_employee, only: [:show, :update]


  # GET /employees
  def index
    @employees = @department.employees.all

    render jsonapi: @employees
  end

  # GET /employees/1
  def show
    render jsonapi: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render jsonapi: @employee, status: :created, message: "Employee sucessfully created."
    else
      logger.debug("Error #{@employee.errors}")
      render jsonapi: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render jsonapi: @employee
    else
      render jsonapi: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
  end

  private
    def set_department
      @department = Department.find(params[:department_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = @department.employees.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      parameter_hash = {}
      #logger.debug("params: #{params.inspect}")
      parameter_hash = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      #logger.debug("parameter_hash: #{parameter_hash}")
      return parameter_hash


      # params.require(:employee).permit(:empno, :ename, :job, :hiredate, :sal, :deptno)
      # params.fetch(:employee, {})
    end

end
