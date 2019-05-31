class Studio < ActiveRecord::Base
  has_many :sessions
  has_many :users, through: :sessions

#FOR STUDIO user experience

  def self.add_new_studio_location(name,category,location)
      Studio.create(name,category,location)
  end

  def self.categories
    self.all.map do |studio|
      studio.category
    end.uniq
  end










end #end of Studio class
