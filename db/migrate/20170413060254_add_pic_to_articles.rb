class AddPicToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :pic, :string
  end
end
