class CreateHomePageLogos < ActiveRecord::Migration
  def change
    create_table :home_page_logos do |t|
      t.has_attached_file :image_one
      t.has_attached_file :image_two
      t.has_attached_file :image_three
      t.has_attached_file :image_four
      t.has_attached_file :image_five
      t.has_attached_file :image_six
      t.has_attached_file :image_seven
      t.has_attached_file :image_eight
      t.has_attached_file :image_nine
      t.has_attached_file :image_ten
      t.has_attached_file :event_image
      t.has_attached_file :conference_image
      t.has_attached_file :sponsor_image
      t.has_attached_file :event_one_image
      t.has_attached_file :event_two_image


      t.timestamps
    end
  end
end
