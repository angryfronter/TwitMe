# frozen_string_literal: true

class CreateAdvertisements < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
