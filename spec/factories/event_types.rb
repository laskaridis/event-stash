FactoryGirl.define do
  factory :event_type, class: "EventType" do
    sequence(:name) { |n| "EventType#{n}" }
    account { SecureRandom.uuid }
    format { "application/xml" }

    trait(:with_attributes) do
      after(:create) do |event_type|
        create(:event_type_attribute, event_type: event_type)
      end
    end
  end
end
