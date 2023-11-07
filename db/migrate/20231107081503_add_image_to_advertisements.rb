class AddImageToAdvertisements < ActiveRecord::Migration[7.0]
  def change
    add_column :advertisements, :image, :string
  end
end
