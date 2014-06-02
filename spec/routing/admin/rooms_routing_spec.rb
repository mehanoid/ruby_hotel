require 'spec_helper'

describe Admin::RoomsController do
  describe 'routing' do

    it 'routes to #index' do
      expect(get('/admin/room_categories/1/rooms')).to route_to('admin/rooms#index', room_category_id: '1')
    end

    it 'routes to #new' do
      expect(get('/admin/room_categories/1/rooms/new')).to route_to('admin/rooms#new', room_category_id: '1')
    end


    it 'routes to #create' do
      expect(post('/admin/room_categories/1/rooms')).to route_to('admin/rooms#create', room_category_id: '1')
    end

    it 'routes to #destroy_multiple' do
      expect(delete('/admin/room_categories/1/rooms/destroy_multiple')).to route_to('admin/rooms#destroy_multiple', room_category_id: '1')
    end

  end
end
