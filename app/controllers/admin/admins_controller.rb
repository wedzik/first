class Admin::AdminsController < ApplicationController
#  before_filter :require_admin_login , only: [:profile, :update_profile, :update]
#  before_filter :require_super_admin_login , only: [:new, :index, :create, :destroy]

  def index
#    @admins = Admin.find_all_by_type 'Admin'

    if params[:order]
      if  params[:direction] == 'up'
        @admins = Admin.order(params[:order]+ " ASC")
        @direction = 'down'
      else
        @admins = Admin.order(params[:order]+ " DESC")
        @direction = 'up'
      end
      @current = params[:order]
    else
      @admins = Admin.all
      @current = 'id'
      @direction = 'up'
    end
    authorize! :index, Admin.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
      @admin = Admin.new
      authorize! :new, @admin
  end

  def update_avatar
    @admin ||= Admin.find(current_user.id)
    if @admin.update_attributes(params[:admin])
      flash[:notice] = "Saved"
    end
    redirect_to admin_profile_path
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
