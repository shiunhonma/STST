class UsersController < ApplicationController

    before_action :require_login, only: [:show, :destroy, :index]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        @user.point = 0
        @user.taught_member = 0
        @user.student_member = 0
        image_path = Rails.root.join("public/images/", "STST_initial.jpg")
        File.open(image_path,"r+b") do |f|
            @user.icon = f.read
        end
        if @user.save
            log_in(@user)
            redirect_to profile_path
        else
            render 'new'
        end
    end

    def show
        @user = User.find(current_user.id)
    end

    def destroy
        current_user.destroy
        redirect_to signup_path
    end

    def edit

    end
    
    def update
        @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(icon_attributes)
        format.html { redirect_to home_mypage_path, notice: "User  was successfully updated." }
      else
        format.html { render :show, status: :unprocessable_entity }
      end
    end
    end


    def get_image
        user = User.find(params[:id])
        send_data(user.icon, disposition: :inline)
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation, :name)
        end
        def user_params_update
            params.require(:user).permit(:name, :icon)
        end

        def icon_attributes
        {
            name: user_params_update[:name], icon: user_params_update[:icon].read
        }
        end
end
