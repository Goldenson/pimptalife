class RegistrationsController < Devise::RegistrationsController

	protected

	  def update_resource(resource, params)
	    # resource.update_without_password(params.except(:current_password))
	    resource.update_without_password(params)
	  end
end