class TwiliosController < ApplicationController
  
  BASE_URL = "http://localhost:3000/twilios"
  
  def incoming
    # Get client by phone number
    client_phone = "+1" << params['From']  
    @client = Client.find_by_phone(client_phone)
    
    # Welcom message.
    # "Welcome to #{@client.name}'s residence."
    # Ask agent to identy him/herself.
    # "Please enter your code"
    @post_to = BASE_URL + "/validate?client_id=#{@client.id}"
    render :action => "incoming.xml.builder", :layout => false
  end
  
  def validate
    @client = Client.find(params[:client_id])
    user_code = params['Digits']
    
    # if agent code is entered correctly and haven't checked in, check in.
    agent = Agent.find_by_code(user_code)
    if agent.checked_in? 
      @post_to = BASE_URL + "/direction?agent_id=#{agent.id}"
      render :action => "direction.xml.builder", :layout => false
    else 
      # "Welcome #{@agent}'s name. Here are tasks for you today. #{tasks}. Good-bye"
      agent.check_in(@client.id)
      @tasks = @client.tasks
      @post_to = BASE_URL + "/read_tasks"
      render :action => "read_tasks.xml.builder", :layout => false
    end
  end
    
  def direction    
    agent = Agent.find(parmas[:agent_id])
    # 1 to hear the tasks again, 2 to check out.
    if params['Digits'] == '1'
      @post_to = BASE_URL + "/read_tasks"
      render :action => "read_tasks.xml.builder", :layout => false
    elsif parmas['Digits'] == '2'
      # if 2, "thank you for your service today."
      if agent.checked_in?
        agent.check_out
        redirect_to :action => 'goodbye'
        return
      else
        redirect_to :action => 'not_checked_in'
        return
      end
    end
    
  end
    
end
