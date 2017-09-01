class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :update, :destroy]

  before_action :authenticate_request!, only: [:index, :logout, :show]

  # GET /users
  def index
    users = User.all
    render jsonapi: users
  end

  def show
    render jsonapi: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render jsonapi: user, status: :created
    else
      render_error(user, :unprocessable_entity)
    end
  end

  def login
    user = User.find_by(email: user_params[:email].to_s.downcase)
    
    if user && user.authenticate(user_params[:password])
        auth_token = JsonWebToken.encode({user_id: user.id})
        user.token = auth_token
        render jsonapi: user, status: :ok
    else
      render jsonapi: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end

  def logout
    render jsonapi: nil , status: :ok
  end

  private
    def set_user
      begin
        @user = User.find params[:id]
      rescue ActiveRecord::RecordNotFound
        user = User.new
        user.errors.add(:id, "Wrong ID provided")
        render_error(user, :not_found) and return
      end
    end

    def user_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
