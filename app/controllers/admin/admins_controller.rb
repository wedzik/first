class Admin::AdminsController < ApplicationController
#  before_filter :require_admin_login , only: [:profile, :update_profile, :update]
#  before_filter :require_super_admin_login , only: [:new, :index, :create, :destroy]

  def index
    @admins = Admin.find_all_by_type 'Admin'
    authorize! :index, @admins.first()
  end

  def new
      @admin = Admin.new
      authorize! :new, @admin
  end

  def update
    @admin ||= current_user
    authorize! :profile_manage, @admin
    respond_to do |format|
      if @admin.update_attributes(params[:admin])
        flash[:notice] = "Saved"
      end
      format.js
    end
  end

  def profile
      flash.now[:notice] = ""
      @admin ||= current_user
      authorize! :profile_manage, @admin
      if  @admin.is_a? SuperAdmin
        redirect_to admin_super_profile_path
      end

  end

  def update_profile
    @admin ||= current_user
    authorize! :profile_manage, @admin
    respond_to do |format|
      format.js
    end
  end

  def create
    @admin = Admin.new(params[:admin])
    authorize! :create, @admin
    @admin.type = @admin.class.name
    if @admin.save
      redirect_to admin_new_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    authorize! :destroy, @admin
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_admins_url }
      format.json { head :no_content }
    end
  end

end
