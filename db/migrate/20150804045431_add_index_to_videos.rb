class AddIndexToVideos < ActiveRecord::Migration
  def change
  	add_index :videos, :user_id
  end
end
