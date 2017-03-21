require "spec_helper"

module EventStash
  describe EventTypesController do

    describe "GET #index" do

      context "given a logged in user" do
        before { login }

        context "given some event types" do
          before do
            @t1 = create(:event_type)
            @t2 = create(:event_type)

            get :index
          end

          it { should respond_with 200 }

          it { should render_template :index }

          it "should assign event types" do
            types = assigns(:event_types)

            expect(types).to include @t1
            expect(types).to include @t2
          end
        end
      end

      context "given a logged out user" do
        before { get :index }

        it { should redirect_to login_url }
      end
    end

    describe "GET #show" do

      context "given a logged in user" do
        before { login }

        context "given an existing event" do
          before do
            @event = create(:event_type)

            get :show, id: @event.id
          end

          it { should render_template :show }

          it { should respond_with 200 }

          it "should assign event" do
            event = assigns(:event_type)
            expect(event).to eq @event
          end
        end
      end

      context "given a logged out user" do
        before { get :show, id: 1 }

        it { should redirect_to login_url }
      end
    end

    describe "GET #new" do

      context "given a logged in user" do
        before do
          login
          get :new
        end

        it { should render_template :new }

        it { should respond_with 200 }

        it "should assign event" do
          event = assigns(:event_type)

          expect(event).to be_an EventType
        end
      end

      context "given a logged out user" do
        before { get :new }

        it { should redirect_to login_url }
      end
    end

    describe "POST #create" do

      context "given a logged in user" do
        before { @user = login }

        context "and valid attributes" do
          let(:attributes) do
            {
              name: "SampleEventName",
              account: @user.email,
              format: "application/json",
              event_type_attributes_attributes: {
                "0" => {
                  name: "Attr1",
                  attribute_type: "integer"
                },
                "1" => {
                  name: "Attr2",
                  attribute_type: "integer"
                }
              }
            }
          end

          before do
            post :create, event_stash_event_type: attributes
          end

          it { should redirect_to event_stash_event_types_path }
          it { should set_flash }
          it "should create event type" do
            event_type = EventType.where(name: attributes[:name]).first!
            expect(event_type).to be_present
            expect(event_type.event_type_attributes.size).to eq 2
            expect(event_type.event_type_attributes.first.name).to eq "Attr1"
            expect(event_type.event_type_attributes.first.attribute_type).to eq "integer"
            expect(event_type.event_type_attributes.last.name).to eq "Attr2"
            expect(event_type.event_type_attributes.last.attribute_type).to eq "integer"
          end
        end

        context "and invalid attributes " do
          before do
            post :create, event_type: {}
          end

          it { should render_template :new }
          it { should_not set_flash }
        end
      end

      context "given a logged out user" do
        before { post :create }

        it { should redirect_to login_url }
      end
    end

    describe "PUT #update" do
      let(:event_type) { create(:event_type) }

      context "given a logged in user" do
        before { login }

        context "and valid attributes" do
          before do
            put :update, id: event_type.id, event_stash_event_type: { description: "New description" }
          end

          it { should render_template :show }
          it { should respond_with 200 }
          it "should update event type" do
            expect(event_type.reload.description).to eq "New description"
          end
        end
      end

      context "given a logged out user" do
        before { put :update, id: 1 }

        it { should redirect_to login_url }
      end
    end
  end
end
