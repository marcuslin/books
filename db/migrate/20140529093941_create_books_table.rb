class CreateBooksTable < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :description
      t.string :cover_thumb_url
      t.string :cover_mid_url

      t.timestamps
    end
  end
end
