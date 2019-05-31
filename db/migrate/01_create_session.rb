class CreateSession < ActiveRecord::Migration[5.2]

  def change
    create_table :sessions do |t|
      t.text :user_id
      t.text :studio_id
      t.datetime :datetime
    end
  end







end #end of CreateSession class
