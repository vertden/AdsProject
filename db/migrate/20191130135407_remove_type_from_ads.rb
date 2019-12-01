class RemoveTypeFromAds < ActiveRecord::Migration[5.2]
  def change
    remove_column :ads, :type, :string
  end
end
