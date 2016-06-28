class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end

    add_reference :blog_posts, :person, index: true
  end
end
