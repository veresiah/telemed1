class WelcomeController < ApplicationController
  skip_before_action :current_user
  def main
  end
end