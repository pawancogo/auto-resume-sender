# frozen_string_literal: true

class WelcomeController < ApplicationController
  # skip_before_action :authenticate_admin!
  skip_before_action :authorize_request
  def index; end
end
