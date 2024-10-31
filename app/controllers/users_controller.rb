class UsersController < ApplicationController
  
  def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Connecte automatiquement l'utilisateur après inscription
      redirect_to root_path, notice: "Inscription réussie ! Bienvenue, #{@user.email}."
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
  end
  
end
