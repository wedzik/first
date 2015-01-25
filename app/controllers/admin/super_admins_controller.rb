class Admin::SuperAdminsController < ApplicationController
  #before_filter :require_super_admin_login , only: [:profile, :update_profile, :update]

  def update
    @super_admin ||= current_user
    authorize! :update, @super_admin
    respond_to do |format|
      if @super_admin.update_attributes(params[:super_admin])
        flash[:notice] = "Saved"
      end
      format.js
    end
  end

  def profile
      flash.now[:notice] = ""
      @super_admin ||= current_user
      authorize! :profile, @super_admin
  end

  def update_profile
    @super_admin ||= current_user
    authorize! :update_profile, @super_admin
    respond_to do |format|
      format.js
    end
  end

end
