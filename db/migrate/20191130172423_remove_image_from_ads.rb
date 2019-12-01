class RemoveImageFromAds < ActiveRecord::Migration[5.2]
  def change
    remove_column :ads, :image, :string
  end
end
