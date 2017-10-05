class DepartmentsController < ApplicationController
  #before_action :authenticate_request!
  before_action :set_department, only: [:show, :update, :destroy]

  # GET /departments
  def index
    if params[:filter] == 'none' then
      @departments = Department.all.order(:dname)
    else
      @departments = Department.left_outer_joins(:employees)
                    .where("dname=? or ename=?", params[:filter], params[:filter])
                    .order(:dname)
    end
    render jsonapi: @departments 
  end

  # GET /departments/1
  def show
    render jsonapi: @department 
  end

  # POST /departments
  def create
    @department = Department.new(department_params)

    if @department.save
      #logger.debug @department.inspect
      render jsonapi: @department, status: :created, location: @department
    else
      render jsonapi: @department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departments/1
  def update
    if @department.update(department_params)
      render jsonapi: @department
    else
      render jsonapi: @department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departments/1
  def destroy
    @department.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def department_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
