class Client < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  has_many :pairs
  belongs_to :admin
      
  def task_list
    tasks = self.tasks rescue nil
    task_list = "There are #{tasks.size} tasks to perform today."
    if tasks.size > 0
      tasks.each_with_index do |task, index|
        task_list << "#{index+1}, #{task}."
      end
    end
    task_list
  end
end
