class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :type
      t.text :plot

      t.timestamps
    end
  end
end
