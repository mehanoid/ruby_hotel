require 'spec_helper'

describe Admin::HomeController do
  before do
    sign_in create(:user)
  end

  describe "GET 'show'" do

    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
