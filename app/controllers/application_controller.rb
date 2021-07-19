class ApplicationController < ActionController::Base
    before_action :current_user  
    include ApplicationHelper
end
