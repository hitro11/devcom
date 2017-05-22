class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :phone_num
      t.text :description
      t.timestamps
    end
  end
end
