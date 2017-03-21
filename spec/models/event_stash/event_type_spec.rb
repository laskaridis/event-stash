require "spec_helper"

module EventStash

  describe EventType do

    it { should have_many(:event_type_attributes).class_name("EventStash::EventTypeAttribute").dependent(:destroy) }

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:description).is_at_most(125) }
    it { should validate_presence_of(:account) }
    it { should validate_presence_of(:format) }
    it { should validate_inclusion_of(:format).in_array(EventType::FORMATS) }
    it { should validate_inclusion_of(:transaction_type).in_array(EventType::TRANSACTION_TYPES) }

    describe "event type factories" do
      
      it "should build a valid instance" do
        expect(build(:event_type)).to be_valid
      end
    end
  end
end
