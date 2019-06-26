class UsersController < ApplicationController

  before_action :require_admin, only: [:index]

  def show
  	  @user = User.find(current_user.id)
  end

  def edit
  	  @user = User.find(params[:id])
  end

  def update
  	  @user = User.find(params[:id])
  	  if @user.update(user_params)
  	  	 redirect_to user_path(@user.id)
  	  else
  	  	 render :edit
  	  end
  end

  def index
      @users = User.all
  end


      private

	          def user_params
	              params.require(:user).permit(:name, :image, :introduce)
	          end

            def require_admin
              if user_signed_in?

                  if current_user.admin?
                  else
                     redirect_to root_path
                  end
              else
                redirect_to root_path
              end
            end

end



