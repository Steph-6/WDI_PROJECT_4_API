class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :name
      t.string  :password_digest
      t.string  :bar_location
      t.string  :band_location
      t.string  :bar_telephone
      t.string  :band_telephone
      t.string  :band_image
      t.string  :bar_image
      t.string  :bar_description
      t.string  :is_bar
      t.string  :website
      t.integer :bar_size
      t.float   :lat
      t.float   :lng
      t.timestamps
    end
  end
end
