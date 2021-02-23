class AddGroupRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :group, foreign_key: true
  end
end
