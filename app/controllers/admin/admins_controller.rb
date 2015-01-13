class Admin::AdminsController < ApplicationController

  before_filter :require_admin_login , only: [:profile, :edit, :show]

  def new
    if current_user
      redirect_to profile_path
    else
      @admin = Admin.new
    end
  end

  def profile
      flash.now[:notice] = ""
      @admin ||= Admin.find(current_user.id)
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to new_admin_admin_path, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def show
    @admin ||= Admin.find(params[:id])
  end

  private
  def require_admin_login
    unless current_user && (current_user.is_a? Admin)
      flash[:error] = "You must be logged in as admin to access this section"
      redirect_to root_path
    end
  end
end
