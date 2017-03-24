require "spec_helper"

describe EventTypeAttributesController do

  describe "POST #create" do

    context "given a logged in user" do
      before { login }

      context "and valid attributes" do
        let(:event_type) { create(:event_type) }
        let(:attributes) { attributes_for(:event_type_attribute) }

        before do
          post :create, event_type_id: event_type.id, event_type_attribute: attributes, format: :js
        end

        it { should render_template :create }
        it "should create event type attribute" do
          expect(event_type.reload.event_type_attributes.size).to eq 1
        end
      end

      context "and invalid attributes " do
        let(:event_type) { create(:event_type) }

        before do
          post :create, event_type_id: event_type.id, event_type_attribute: {}, format: :js
        end

        it { should render_template :new }
      end
    end

    context "given a logged out user" do
      before { post :create, event_type_id: 1, format: :js }

      it { should respond_with 401 }
    end
  end

  describe "GET #edit" do

    context "given a logged in user" do
      before { login }

    end

    context "given a logged out user" do
      before { get :edit, id: 1, format: :js }

      it { should respond_with 401 }
    end
  end

  describe "PUT #update" do

    context "given a logged in user" do
      before { login }

    end

    context "given a logged out user" do
      before { put :update, id: 1, format: :js }

      it { should respond_with 401 }
    end
  end

  describe "DELETE #destroy" do

    context "given a logged in user" do
      before { login }

    end

    context "given a logged out user" do
      before { delete :destroy, id: 1, format: :js }

      it { should respond_with 401 }
    end
  end
end