class AddAuthorPrimaryKey < ActiveRecord::Migration[5.0]
  def change
    change_column_null :authors, :internet_id, false
    add_index :authors, :internet_id, unique: true
  end
end
