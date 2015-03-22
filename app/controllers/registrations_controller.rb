class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

  def update_resource(resource, params)
    resource.update_without_password(params.except(:current_password))
  end
end