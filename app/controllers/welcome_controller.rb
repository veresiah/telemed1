class WelcomeController < ApplicationController
  skip_before_action :current_user, :require_login
  def main
  end
end