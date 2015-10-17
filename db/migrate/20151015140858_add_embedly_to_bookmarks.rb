class AddEmbedlyToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :embedly, :string
  end
end
