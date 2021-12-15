module Concern
  extend ActiveSupport::Concern
    def set_user
      if(params[:user_id] && User.find(params[:user_id]))
        @user = User.find(params[:user_id])
      else
        redirect_to login_path, alert: "Please login with valid user."
      end
    end

    def has_session
      if(session[:user_id])
        @user=User.find(session[:user_id])
      else
        redirect_to login_path, alert: "Please login with valid user."
      end

    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :name, :password,:password_confirmation)
    end

end