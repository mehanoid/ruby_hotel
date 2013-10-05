module Admin
  class AdminController < ApplicationController
    before_filter :authenticate_user!

    layout 'admin/admin'

  end
end