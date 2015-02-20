class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
    end
  end

  #TODO: Add reset user password on ajax
  #TODO: Om=n user create set position value max+1
  def index
    @users = User.paginate(:page => params[:page]).order(sort_column + ' ' + sort_direction)
    authorize! :index, User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def drag
    positions = []
    items = []
    params.each do |key, value|
      if (key.to_s.match(/^(\d)+$/))
        positions << value
        items << User.find(key.to_s.to_i);
      end
    end
    positions.sort!
    if params['sort'] == 'desc'
      positions.reverse!
    end
    i=0;
    items.each do |user|
      if(user.position != positions[i])
        user.position = positions[i]
        user.save
      end
      i+=1
    end

    @users = User.paginate(:page => params[:page]).order(sort_column + ' ' + params['sort'])
    @current = 'id'
    @direction = 'up'
    render 'index.js.erb'
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        flash[:notice] = 'Signed up!'
        session[:user_id] = @user.id
        render :js => "window.location = '#{log_in_path}'"
      else
        render "new.js"
      end
  end

  def profile
    if current_user
      if current_user.is_a? Admin
        redirect_to admin_profile_path
        return
      end
      @user ||= current_user
      authorize! :profile, @user
    else
      redirect_to log_in_path
    end
  end

  def files
    if current_user
      if current_user.is_a? Admin
        redirect_to admin_profile_path
        return
      end
      flash.now[:notice] = ""
      @user ||= User.find(current_user.id)
      authorize! :profile, @user
    else
      redirect_to log_in_path
    end
  end

  def upload_files
    @user_file = UserFile.new
    @user_file.name = params[:files][0]
    @user_file.user = current_user;
    @user_file.display_name = @user_file.name.identifier
    @user_file.size = File.new(@user_file.name.current_path).size
    if @user_file.save
      render :json => { :files => [current_user.user_files.last] }.to_json
    else
      render :json => { :files => [@user_file] }.to_json
    end
  end

  def uploaded_files
    render :json => { :files => current_user.user_files }.to_json
  end

  def delete_file
    @file = current_user.user_files.find(params[:id])
    @file_name = @file.display_name
    if @file && @file.destroy
      render :json => { :files => [(@file_name.to_s).to_sym => true] }.to_json
    else
      render nothing: TRUE
    end
  end

  def reset_password
    @user ||= User.find(params[:id])
    authorize! :reset_password, @user
  end

  def save_password
    @user ||= User.find(params[:id])
    authorize! :save_password, @user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Password saved for #{@user.email}"
    end
    redirect_to users_path
  end

  def update
    @user ||= User.find(params[:id])
    authorize! :update, @user
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = "Saved"
      end
      format.js
    end
  end

  def update_avatar
    @user = current_user
    authorize! :update_avatar, @user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Saved"
      redirect_to profile_path, :notice => "Saved"
    else
      redirect_to profile_path, :alert => @user.errors
    end
  end

  def update_profile
    @user ||= User.find(params[:id])
    authorize! :update_profile, @user
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "position"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
