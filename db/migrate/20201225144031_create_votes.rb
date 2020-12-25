class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.references :votable, polymorphic: true
      t.references :voter
      t.timestamps
    end
  end
end
