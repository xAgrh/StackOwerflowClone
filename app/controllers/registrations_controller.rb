class RegistrationsController < Devise::RegistrationsController
  
  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      profile_attributes: [:nickname, :website, :location, :birthday, :about_me, :avatar])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation,
      :current_password, profile_attributes: [:nickname, :website, :location, :birthday, :about_me, :avatar, :id])
  end
    
end