class Admin::AdminsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @admins = Admin.paginate(:page => params[:page]).order(sort_column + ' ' + sort_direction)
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
      render "close_modal.js"
    else
      render "new.js"
    end
#    if @admin.save
  #    redirect_to admin_new_path, :notice => "Signed up!"
 #   else
      #respond_to do |format|
       # format.js
      #end
#    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    authorize! :destroy, @admin
    @admin.destroy
    respond_to do |format|
      format.js
    end
  end


  private
  def sort_column
    Admin.column_names.include?(params[:sort]) ? params[:sort] : "email"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
