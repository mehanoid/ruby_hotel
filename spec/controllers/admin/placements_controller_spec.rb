require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Admin::PlacementsController do

  # This should return the minimal set of attributes required to create a valid
  # Placement. As you add validations to Placement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { 'room' => attributes_for } }
  #let(:valid_attributes) { { "room" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlacementsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all placements as @placements' do
      placement = Placement.create! valid_attributes
      get :index, {}, valid_session
      assigns(:placements).should eq([placement])
    end
  end

  describe 'GET show' do
    it 'assigns the requested placement as @placement' do
      placement = Placement.create! valid_attributes
      get :show, {:id => placement.to_param}, valid_session
      assigns(:placement).should eq(placement)
    end
  end

  describe 'GET new' do
    it 'assigns a new placement as @placement' do
      get :new, {}, valid_session
      assigns(:placement).should be_a_new(Placement)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested placement as @placement' do
      placement = Placement.create! valid_attributes
      get :edit, {:id => placement.to_param}, valid_session
      assigns(:placement).should eq(placement)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Placement' do
        expect {
          post :create, {:placement => valid_attributes}, valid_session
        }.to change(Placement, :count).by(1)
      end

      it 'assigns a newly created placement as @placement' do
        post :create, {:placement => valid_attributes}, valid_session
        assigns(:placement).should be_a(Placement)
        assigns(:placement).should be_persisted
      end

      it 'redirects to the created placement' do
        post :create, {:placement => valid_attributes}, valid_session
        response.should redirect_to(Placement.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved placement as @placement' do
        # Trigger the behavior that occurs when invalid params are submitted
        Placement.any_instance.stub(:save).and_return(false)
        post :create, {:placement => { 'room' => 'invalid value'}}, valid_session
        assigns(:placement).should be_a_new(Placement)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Placement.any_instance.stub(:save).and_return(false)
        post :create, {:placement => { 'room' => 'invalid value'}}, valid_session
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested placement' do
        placement = Placement.create! valid_attributes
        # Assuming there are no other placements in the database, this
        # specifies that the Placement created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Placement.any_instance.should_receive(:update).with({ 'room' => ''})
        put :update, {:id => placement.to_param, :placement => { 'room' => ''}}, valid_session
      end

      it 'assigns the requested placement as @placement' do
        placement = Placement.create! valid_attributes
        put :update, {:id => placement.to_param, :placement => valid_attributes}, valid_session
        assigns(:placement).should eq(placement)
      end

      it 'redirects to the placement' do
        placement = Placement.create! valid_attributes
        put :update, {:id => placement.to_param, :placement => valid_attributes}, valid_session
        response.should redirect_to(placement)
      end
    end

    describe 'with invalid params' do
      it 'assigns the placement as @placement' do
        placement = Placement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Placement.any_instance.stub(:save).and_return(false)
        put :update, {:id => placement.to_param, :placement => { 'room' => 'invalid value'}}, valid_session
        assigns(:placement).should eq(placement)
      end

      it "re-renders the 'edit' template" do
        placement = Placement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Placement.any_instance.stub(:save).and_return(false)
        put :update, {:id => placement.to_param, :placement => { 'room' => 'invalid value'}}, valid_session
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested placement' do
      placement = Placement.create! valid_attributes
      expect {
        delete :destroy, {:id => placement.to_param}, valid_session
      }.to change(Placement, :count).by(-1)
    end

    it 'redirects to the placements list' do
      placement = Placement.create! valid_attributes
      delete :destroy, {:id => placement.to_param}, valid_session
      response.should redirect_to(placements_url)
    end
  end

end
