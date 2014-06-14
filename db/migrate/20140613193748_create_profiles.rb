class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.string :website
      t.string :location
      t.date :birthday
      t.text :about_me
      t.string :avatar
      
      t.references :user, index: true
      
      
      t.timestamps
    end
  end
end
