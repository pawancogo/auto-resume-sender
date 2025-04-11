# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authorize_request, only: %i[signup signin]

  def signup
    user = User.new(permitted_params)
    if user.save
      render_success({ data: user, message: 'Created successfully' }, status: :created)
    else
      render_error({ errors: user.errors.full_messages }, status: :unprocessable_entity)
    end
  end

  def signin
    user = User.find_by_email(permitted_params[:email])
    return render_error({ error: 'Email not found' }) if user.nil?

    if user&.authenticate(permitted_params[:password])
      token = JwtService.encode(user_id: user.id)
      return render_success({ data: user, message: 'Signed in successfully!', instance_options: {token: token} }, status: :ok)
    end
    render_error({ error: 'Incorrect password' })
  end

  def profile
    render_success({data: @current_user})
  end

  private

  def permitted_params
    params.require(:user).permit(:email, :password, :name, :phone_number)
  end
end
