module Admin
  class AdminController < ApplicationController
    before_filter :authenticate_user!
    check_authorization

    layout 'admin/admin'

  end
end