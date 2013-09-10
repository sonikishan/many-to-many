class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.includes(:groups).find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.attributes = {'group_ids' => []}.merge(params[:user] || {})

    # Observe that we're calling save instead of update_attributes.
    if @user.save
      flash[:notice] = "User #{ @user.first_name } #{ @user.last_name} has been saved successfully."
      redirect_to(users_path)
    else
      render(:edit, :error => @user.errors)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.attributes = {'group_ids' => []}.merge(params[:user] || {})

    if @user.save
      redirect_to(users_path, :notice => "User #{ @user.first_name } #{ @user.last_name } has been created successfully.")
    else
      render(:edit, :error => @user.errors)
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])

    if @user.destroy
      redirect_to(users_path, :notice => "User #{ @user.first_name } #{ @user.last_name } has been deleted successfully.")
    else
      redirect_to(users_path, :error => "User #{ @user.first_name } #{ @user.last_name } could not be deleted.")
    end
  end
end
