class AddSectionIdToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :section_id, index: true, foreign_key: true
  end
end
