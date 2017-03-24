class CreateEventTypeAttributes < ActiveRecord::Migration
  def change
    create_table :event_type_attributes do |t|
      t.string :name, null: false
      t.string :description
      t.integer :event_type_id, null: false
      t.string :attribute_type, null: false
      t.timestamps null: false
    end

    add_foreign_key :event_type_attributes, :event_types
  end
end
