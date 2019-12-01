class AddAdTypeToAd < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :type_id, :integer
  end
end
