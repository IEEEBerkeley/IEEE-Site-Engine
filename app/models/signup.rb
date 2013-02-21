class Signup < ActiveRecord::Base
  
  after_initialize  :init
  
  belongs_to  :user
  belongs_to  :event
  
  validates_presence_of :role
  validates :user_id, :uniqueness => {:scope => :event_id}
  
  def init
    self.attended = false unless self.attended
  end
  
end
