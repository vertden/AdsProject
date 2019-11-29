class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.text :body
      t.string :image
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
