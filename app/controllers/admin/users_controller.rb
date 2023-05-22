module Admin
  class UsersController < BaseController
    def index
      authorize :user_dashboard, :index?

      @users = User.all.order(id: :desc)
    end

    def edit
      authorize :user_dashboard, :edit?

      @user = User.find(params[:id])
    end

    def update
      authorize :user_dashboard, :update?

      @user = User.find(params[:id])

      @user.update(user_params)
      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:role_id)
    end
  end
end
