FactoryGirl.define do

  factory :event_type_attribute, class: "EventStash::EventTypeAttribute" do
    association :event_type
    sequence(:name) { |n| "EventTypeAttributeName#{n}" }
    attribute_type "string"

    trait(:string) do
      attribute_type "string"
    end

    trait(:integer) do
      attribute_type "integer"
    end

    trait(:float) do
      attribute_type "float"
    end

    trait(:datetime) do
      attribute_type "datetime"
    end

    trait(:boolean) do
      attribute_type "boolean"
    end
  end
end
