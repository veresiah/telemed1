class ApplicationController < ActionController::Base
    before_action :current_user, :require_login
    include ApplicationHelper
end
