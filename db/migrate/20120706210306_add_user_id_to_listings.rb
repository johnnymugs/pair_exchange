class AddUserIdToListings < ActiveRecord::Migration
  def up
    execute <<-SQL
      DELETE FROM listings;
    SQL

    add_column :listings, :user_id, :integer
  end

  def down
    remove_column :listings, :user_id
  end
end
