require "spec_helper"

module EventStash

  describe EventTypeAttribute do

    it { should belong_to :event_type }

    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:description).is_at_most(125) }
    it { should validate_presence_of(:event_type) }
    it { should validate_presence_of :attribute_type }
    it { should validate_inclusion_of(:attribute_type).in_array(EventTypeAttribute::TYPES) }

    describe "event type attribute factories" do

      it "should build a valid event type attribute" do
        expect(build(:event_type_attribute)).to be_valid
      end

      it "should build a valid event type string attribute" do
        expect(build(:event_type_attribute, :string)).to be_valid
      end

      it "should build a valid event type integer attribute" do
        expect(build(:event_type_attribute, :integer)).to be_valid
      end

      it "should build a valid event type float attribute" do
        expect(build(:event_type_attribute, :float)).to be_valid
      end

      it "should build a valid event type datetime attribute" do
        expect(build(:event_type_attribute, :datetime)).to be_valid
      end

      it "should build a valid event type boolean attribute" do
        expect(build(:event_type_attribute, :boolean)).to be_valid
      end
    end
  end
end
