class SessionsController < ApplicationController
  def new
  end

  def create


      user=User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        session[:user_id]=user.id
        redirect_to profile_path(user),notice:'Oturum Açıldı'
      else
        flash[:error]="e-mail/Parola Hatalı!"
        redirect_to login_path
      end
    else
   end

  def destroy
    session[:user_id]=nil
    redirect_to login_path,notice: 'Oturum Sonlandırıldı.'
  end
end
