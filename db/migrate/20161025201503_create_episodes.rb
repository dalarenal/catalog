class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :plot
      t.integer :number
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
