class UserSessionsController < ApplicationController
  def new
		@user_session = UserSession.new  
  end

	def create
	
 	@user_session = UserSession.new(params[:user_session])
  @user_session.save do |result|
    if result
      flash[:notice] = "Login successful!"
      redirect_to root_url
    else
      render :action => :new
    end
  end

end

    def edit  
      @user = current_user  
    end  
      
    def destroy  
      @user_session = UserSession.find  
      @user_session.destroy  
      flash[:notice] = "Abmeldung erfolgreich."  
      redirect_to root_url  
    end  
end
