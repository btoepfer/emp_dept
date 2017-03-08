class ApplicationController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActiveRecord::RecordNotUnique, with: :record_not_unique
  rescue_from ::NameError, with: :error_occurred
  rescue_from ::ActionController::RoutingError, with: :error_occurred

  protected

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
end
