class User < ActiveRecord::Base
  has_many :sessions
  has_many :studios, through: :sessions



  #READ from CRUD methods

  #return an array of strings containing every session at a specific studio

  # def session_for_studio
  #   Session.all.select do |session|
  #     session.count.studio == studio
  #   end
  #
  # end



  #delete user : this is working

  # def self.delete_user
  #   User.delete(session.id)
  # end
  #
  # def cancel_session
  #   Session.delete(session.id)
  # end
  #
  # def does_session_exist?
  #   Session.exists?(self.id)
  # end
  #
  # #session.id? (before I had self, but i moved it from the session class to the user class b/cuz the user is creating this)
  #
  # def add_new_session_to_schedule(user_id, studio_id, datetime)
  #   Session.create(user_id, studio_id, datetime)
  # end
  #
  # def how_many_classes_completed?
  #   self.session.count(self.id)
  # end






end #end of User class
