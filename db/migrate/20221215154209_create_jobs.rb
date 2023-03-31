class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :image
      t.string :recruiter
      t.string :details
      t.string :category
      t.date :deadline
      t.integer :user_id
      t.timestamps
    end
  end
end
