class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.date :add_date
      t.boolean :added

      t.timestamps null: false
    end
  end
end
