class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :job_id

      t.timestamps
    end

    add_index :comments, :job_id
  end
end
