module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.role = 'ingeniero'
      if @user.save
        redirect_to admin_users_path, notice: 'Ingeniero creado exitosamente.'
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'Usuario actualizado exitosamente.'
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: 'Usuario eliminado exitosamente.'
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :color, :role)
    end

    def authorize_admin
      redirect_to root_path, alert: 'No autorizado.' unless current_user.admin?
    end
  end
end
