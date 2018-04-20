class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true, index: true
      t.string     :name
      t.string     :description

      t.timestamps
    end
  end
end
