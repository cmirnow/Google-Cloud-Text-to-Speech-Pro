class ApplicationController < ActionController::Base
  def find_admin
    @admin = Admin.find_by(id: 1)
  end
end
