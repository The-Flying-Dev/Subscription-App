class AdminController < ApplicationController
    #check to make sure the user is an admin
    
    before_action :check_for_admin
    def check_for_admin
      if current_user.nil? || !current_user.is_admin?
        redirect_to root_path, alert: "You must be an admin to access this path."
      end
    end
end