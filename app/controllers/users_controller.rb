class UsersController < ApplicationController
def new
	@user = User.new
end

def create
  @user = User.new(params[:user])

	@user.role = Role.find_or_create_by_name("operator")
  @user.save do |result|
    if result
      flash[:notice] = "Registration successful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end

def edit
  @user = current_user
end

def update
	@user = current_user
  @user.attributes = params[:user]
  @user.save do |result|
    if result
      flash[:notice] = "Dein Profil wurde erfolgreich aktualisiert."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
end
