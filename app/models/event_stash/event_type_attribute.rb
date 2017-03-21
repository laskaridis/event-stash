module EventStash
  class EventTypeAttribute < ActiveRecord::Base

    TYPE_INTEGER = "integer"
    TYPE_FLOAT = "float"
    TYPE_STRING = "string"
    TYPE_DATETIME = "datetime"
    TYPE_BOOLEAN = "boolean"

    TYPES = [
      TYPE_INTEGER,
      TYPE_FLOAT,
      TYPE_STRING,
      TYPE_DATETIME,
      TYPE_BOOLEAN
    ]

    belongs_to :event_type, class_name: "EventStash::EventType", inverse_of: :event_type_attributes

    validates :name, presence: true, length: { maximum: 50 }
    validates :description, length: { maximum: 125 }
    validates :event_type, presence: true
    validates :attribute_type, presence: true, inclusion: { in: TYPES }
  end
end
