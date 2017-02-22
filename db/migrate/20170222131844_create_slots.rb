class CreateSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :slots do |t|
      t.float    :duration
      t.text     :description
      t.integer  :slots_on_offer
      t.integer  :slots_taken
      t.boolean  :is_active?

      t.timestamps
    end
  end
end
