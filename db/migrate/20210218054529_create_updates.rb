class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.string :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
