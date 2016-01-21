class RemoveReviewIdFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :review_id, :integer
  end
end
