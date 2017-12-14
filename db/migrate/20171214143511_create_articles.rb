class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :image
      t.string :keywords
      t.string :summary
      t.string :content

      t.timestamps
    end
  end
end
