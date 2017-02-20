class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.datetime   :date
      t.integer    :slots_on_offer
      t.integer    :slots_taken
      t.boolean    :is_active?

      t.timestamps
    end
  end
end
