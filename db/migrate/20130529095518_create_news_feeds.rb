class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.text :feed_news

      t.timestamps
    end
  end
end
