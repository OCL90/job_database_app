class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :company
      t.string :job_title
      t.date :date_applied
      t.string :email_received
      t.string :email_username
      t.string :password
      t.text :job_description
      t.references :user, index: true

      t.timestamps
    end
  end
end
