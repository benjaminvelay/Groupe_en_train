class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
