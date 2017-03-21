class CreateEventAttributeGroups < ActiveRecord::Migration
  def change
    create_table :event_attribute_groups do |t|
      t.string :name, null: false
      t.string :description
      t.string :account, null: false
      t.timestamps null: false
    end
  end
end
