class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :internet_id
      t.string :first_name
      t.string :last_name
      t.string :tenure_status
      t.string :scopus_author_id
      t.integer :author_position
      t.integer :hindex
      t.string :dept_id
      t.string :dept_name

      t.timestamps
    end
  end
end
