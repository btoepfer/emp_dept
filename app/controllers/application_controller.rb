class ApplicationController < ActionController::API
  require 'json_web_token'

  #rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActiveRecord::RecordNotUnique, with: :record_not_unique
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::ActionController::RoutingError, with: :error_occurred

  before_action :check_header
  
  private
    def check_header
      if ['POST','PUT','PATCH'].include? request.method
        if request.content_type != "application/vnd.api+json"
          head :not_acceptable and return
        end
      end
    end
  
    def validate_type
      if params['data'] && params['data']['type']
        if params['data']['type'] == params[:controller]
          return true
        end
      end
      head :conflict and return
    end
  

    def record_not_found(exception)
      render jsonapi: exception.message, status: :not_found
      return
    end

    def record_not_unique(exception)
      render jsonapi: exception.message, status: :internal_server_error
      return
    end

    def error_occurred(exception)
      render jsonapi: exception.message, status: :internal_server_error
      return
    end

    def render_error(resource, status)
      render jsonapi: resource, status: status, adapter: :json_api, serializer: ActiveModel::Serializer::ErrorSerializer
    end

  protected
    # Validates the token and user and sets the @current_user scope
    def authenticate_request!
      #logger.debug("payload.first: #{payload.first}")
      if !payload || !JsonWebToken.valid_payload(payload.first)
        return invalid_authentication
      end
    
      load_current_user!
      invalid_authentication unless @current_user
    end
    
    # Returns 401 response. To handle malformed / invalid requests.
    def invalid_authentication
      render jsonapi: {error: 'Invalid Request'}, status: :unauthorized
    end
    
    private
    # Deconstructs the Authorization header and decodes the JWT token.
    def payload
      auth_header = request.headers['Authorization']
      token = auth_header.split(' ').last
      JsonWebToken.decode(token)
    rescue
      nil
    end
    
    # Sets the @current_user with the user_id from payload
    def load_current_user!
      @current_user = User.find_by(id: payload[0]['user_id'])
    end
end
