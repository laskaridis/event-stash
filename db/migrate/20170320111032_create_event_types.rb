class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.string :name, null: false
      t.string :description
      t.string :account, null: false
      t.string :format, null: false
      t.string :transaction_type, null: false, default: "support"
      t.boolean :strict_format, null: false, default: false
      t.timestamps null: false
    end

    add_index :event_types, [:name, :account]
  end
end
