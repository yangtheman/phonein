class Agent < ActiveRecord::Base
  belongs_to :admin
  has_many :pairs
  
  attr_accessor :validated, :client_id
  
  def initialize 
    @validated = false
    @client_id = nil
    super()
  end
  
  state_machine :state, :initial => :not_checked_in do
    
    after_transition :not_checked_in => :checked_in do |agent, transition|
      agent.client_id = transition.args.first
    end
    
    after_transition any => :not_checked_in do |agent, transition|
      agent.validated = false
      agent.client_id = nil
    end
    
    event :check_in do
      transition :not_checked_in => :checked_in, :if => :validated
    end
    
    event :check_out do
      transition :checked_in => :not_checked_in, :if => :validated
    end
    
    state :not_checked_in do
    end
    
    state :checked_in do
    end
  end  
  
end
