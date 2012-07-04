class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :body

      t.timestamps
    end
  end
end
