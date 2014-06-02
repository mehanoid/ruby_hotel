require 'spec_helper'

describe Admin::RoomCategoriesController do
  describe 'routing' do

    it 'routes to #index' do
      expect(get('/admin/room_categories')).to route_to('admin/room_categories#index')
    end

    it 'routes to #new' do
      expect(get('/admin/room_categories/new')).to route_to('admin/room_categories#new')
    end

    it 'routes to #show' do
      expect(get('/admin/room_categories/1')).to route_to('admin/room_categories#show', :id => '1')
    end

    it 'routes to #edit' do
      expect(get('/admin/room_categories/1/edit')).to route_to('admin/room_categories#edit', :id => '1')
    end

    it 'routes to #create' do
      expect(post('/admin/room_categories')).to route_to('admin/room_categories#create')
    end

    it 'routes to #update' do
      expect(put('/admin/room_categories/1')).to route_to('admin/room_categories#update', :id => '1')
    end

    it 'routes to #destroy' do
      expect(delete('/admin/room_categories/1')).to route_to('admin/room_categories#destroy', :id => '1')
    end

  end
end
