class AddReferencesToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :article, foreign_key: true
  end
end
