module Admin
  class HomeController < AdminController
    def show
      authorize! :read, :admin_home
    end
  end
end
