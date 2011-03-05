class Event < ActiveRecord::Base
  has_event_calendar 
  
  
  def color
    "#266dbb;"
  end

end
