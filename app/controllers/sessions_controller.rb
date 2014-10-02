class SessionsController < ApplicationController


  def create
      @user = User.find_by_email_and_password( params[:email], params[:password] )

    if @user.present?
      session[:user_id] = @user.id
      flash[:notice] = "You've logged in as #{@user.email}"
      redirect_to root_path
    else
      flash[:notice] = "Invalid user/password combination"
      redirect_to root_path
  end
end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You've logged out yo"
    redirect_to root_path
  end



  def new
    @user = User.new
  end





end
