#Join table
class Session < ActiveRecord::Base
  belongs_to :studio
  belongs_to :user

  def update_session_time(datetime)
    Session.update(self.id,datetime)
  end

end #end of Session class
