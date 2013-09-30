module Admin
  class AdminController < ApplicationController
    before_filter :authenticate_user!

  end
end