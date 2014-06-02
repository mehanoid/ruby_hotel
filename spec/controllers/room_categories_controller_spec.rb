require 'spec_helper'

describe RoomCategoriesController do

  describe 'GET index' do
    it 'assigns all room_categories as @room_categories' do
      room_category = create(:room_category)
      get :index
      expect(assigns(:room_categories)).to eq([room_category])
    end
  end

  describe "GET 'available_arrival_dates'" do
    pending do
      it 'returns http success' do
        get 'available_arrival_dates'
        expect(response).to be_success
      end
    end
  end

end
