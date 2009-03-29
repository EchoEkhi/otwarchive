class AdminsController < ApplicationController
  before_filter :admin_only
  
  def access_denied
    flash[:error] = t('admin_only', :default => "I'm sorry, only an admin can look at that area.")
   store_location
    redirect_to new_admin_session_path
    false
  end
  
  # GET /admins
  # GET /admins.xml
  def index
    @admins = Admin.find(:all)
  end

  # GET /admins/1
  # GET /admins/1.xml
  def show
    @admin = Admin.find(params[:id])
  end

  # DELETE /admins/1
  # DELETE /admins/1.xml
  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to admins_url
  end
end
