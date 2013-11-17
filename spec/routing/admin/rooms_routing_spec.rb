require 'spec_helper'

describe Admin::RoomsController do
  describe 'routing' do

    it 'routes to #index' do
      get('/admin/room_categories/1/rooms').should route_to('admin/rooms#index', room_category_id: '1')
    end

    it 'routes to #new' do
      get('/admin/room_categories/1/rooms/new').should route_to('admin/rooms#new', room_category_id: '1')
    end


    it 'routes to #create' do
      post('/admin/room_categories/1/rooms').should route_to('admin/rooms#create', room_category_id: '1')
    end

    it 'routes to #destroy_multiple' do
      delete('/admin/room_categories/1/rooms/destroy_multiple').should route_to('admin/rooms#destroy_multiple', room_category_id: '1')
    end

  end
end
