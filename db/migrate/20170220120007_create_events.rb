class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.datetime   :date
      t.integer    :slots_on_offer
      t.string     :is_expired
      t.string     :is_at_capacity
      t.text       :description
      t.timestamps
    end
  end
end
