class DbResetController < ApplicationController
  def reset
    `rake db:reset`
    redirect_to dbreset_url, notice: 'База данных сброшена'
  end
end
