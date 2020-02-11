class UsersController < ApplicationController
    # validates :username, uniqueness: true
    # validates :email, uniqueness: true
    before_action :require_login
    before_action :set_user, only: [:show, :edit]
    skip_before_action :require_login, only: [:index, :new, :create]

    def index
        render 'login'
    end

    def new
        @user = User.new
    end
    
    def create 
        @user = User.create(user_params)
        if @user.id == nil
            redirect_to new_user_path
        else
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        end
    end

    def edit
    end

    def show
    end

    private 
    
    def user_params
        params.require(:user).permit(
            :username,
            :email,
            :password,
            :password_confirmation
        )
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
