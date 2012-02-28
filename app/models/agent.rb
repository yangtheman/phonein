class Agent < ActiveRecord::Base
  belongs_to :admin
  has_many :pairs
  
  def check_in(cid)
    self.pairs.create(:client_id => cid, :state => "checked_in")
  end
  
  def check_out(cid)
    self.pairs.create(:client_id => cid, :state => "not_checked_in")
  end
  
  def checked_in?(cid)
    if self.pairs.last 
      self.pairs.last.client_id == cid.to_i && self.pairs.last.state == "checked_in"
    else
      nil
    end
  end
  
end
