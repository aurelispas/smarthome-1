class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:notice]="Kayıt başarılı"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user=User.find(session[:user_id])
  rescue
    redirect_to login_path

  end

private
  def user_params
    params.require(:user).permit!
  end


end
