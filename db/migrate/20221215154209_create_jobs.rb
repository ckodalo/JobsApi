class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :recruiter
      t.string :location
      t.integer :user_id
      t.string :details
      t.string :category
      t.date :deadline

      t.timestamps
    end
  end
end
