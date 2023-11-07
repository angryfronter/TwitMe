class AddImageUidToAdvertisements < ActiveRecord::Migration[7.0]
  def change
    add_column :advertisements, :image_uid, :string
  end
end
