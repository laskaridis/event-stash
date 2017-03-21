module EventStash
  class EventType < ActiveRecord::Base

    FORMAT_JSON = "application/json"
    FORMAT_XML = "application/xml"

    FORMATS = [
      FORMAT_JSON,
      FORMAT_XML
    ]

    TX_SUPPORT = "support"
    TX_REQUIRE = "require"
    TX_CREATE = "create"
    TX_NEVER = "never"

    TRANSACTION_TYPES = [
      TX_SUPPORT,
      TX_REQUIRE,
      TX_CREATE,
      TX_NEVER
    ]

    has_many :event_type_attributes,
      class_name: "EventStash::EventTypeAttribute",
      dependent: :destroy,
      inverse_of: :event_type

    accepts_nested_attributes_for :event_type_attributes,
      allow_destroy: true,
      reject_if: :all_blank

    validates :name, presence: true, length: { maximum: 50 }
    validates :description, length: { maximum: 125 }
    validates :account, presence: true
    validates :format, presence: true,  inclusion: { in: FORMATS }
    validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }

    validates_associated :event_type_attributes
  end
end
