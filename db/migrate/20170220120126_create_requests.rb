class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table   :requests do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.string     :status

      t.timestamps
    end
  end
end
