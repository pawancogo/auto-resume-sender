# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApiResponder
  before_action :authorize_request
  # before_action :authenticate_admin!
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  rescue_from StandardError, with: :handle_standard_error
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    token = request.headers['AUTHTOKEN'] || request.headers['authtoken'] || params['authtoken']
    begin
      @decoded = JwtService.decode(token)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  private

  def handle_standard_error(exception)
    logger.error exception.message
    logger.error exception.backtrace.join("\n")

    response = {
      error: exception.message
    }

    # if Rails.env.development?
    response[:exception_class] = exception.class.name
    response[:backtrace] = exception.backtrace
    # end

    render json: response, status: :internal_server_error
  end
end
