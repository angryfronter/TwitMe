# frozen_string_literal: true

class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true, default: User.first.id
  end
end
