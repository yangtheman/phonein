class Client < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  has_many :pairs
  belongs_to :admin
      
  validates :phone, :uniqueness => true
  
  def task_list
    tasks = self.tasks
    task_list = "There are #{tasks.size} tasks to perform today."
    if tasks.size > 0
      tasks.each_with_index do |task, index|
        task_list << "Task #{index+1}, #{task.name}. "
      end
    end
    task_list
  end
  
  def agent
    if self.pairs.last.state == "checked_in"
      Agent.find(self.pairs.last.agent_id)
    else
      nil
    end
  end
end
