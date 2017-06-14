class Addparamstocollabs < ActiveRecord::Migration
  def change
    change_table :collaborators do |t|
      t.integer :wiki_id
      t.integer :user_id
    end
  end
end
