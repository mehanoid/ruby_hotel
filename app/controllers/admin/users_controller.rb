module Admin
  class UsersController < AdminController
    inherit_resources
    actions :all, except: %i[ show ]
    respond_to :html
    load_and_authorize_resource

    private

    def permitted_params
      params.permit(user: [:email, :password, :password_confirmation, :role])
    end

  end
end