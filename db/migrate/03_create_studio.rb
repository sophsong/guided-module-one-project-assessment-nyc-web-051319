class CreateStudio < ActiveRecord::Migration[5.2]

  def change
    create_table :studios do |t|
      t.string :name
      t.string :category
      t.string :location
      t.datetime :created_at
      t.datetime :updated_at

    end
  end






end #end of CreateStudio class
