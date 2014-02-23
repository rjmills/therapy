class CreateNewsPosts < ActiveRecord::Migration
  def change
    create_table :news_posts do |t|
    	t.string :title
    	t.text :body
    	t.integer :user_id
    end
  end
end
