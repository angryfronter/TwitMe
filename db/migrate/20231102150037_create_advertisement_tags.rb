# frozen_string_literal: true

class CreateAdvertisementTags < ActiveRecord::Migration[7.0]
  def change
    create_table :advertisement_tags do |t|
      t.belongs_to :advertisement, null: false, foreign_key: true
      t.belongs_to :tag, null: false, foreign_key: true

      t.timestamps
    end

    add_index :advertisement_tags, %i[advertisement_id tag_id], unique: true
  end
end
