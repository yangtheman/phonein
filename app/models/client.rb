class Client < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  has_many :pairs
  belongs_to :admin
  
  def assigned_agent
    self.pairs.where("current = ?", true).last.agent
  end
end
