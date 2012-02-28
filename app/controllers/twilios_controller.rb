class TwiliosController < ApplicationController
  
  BASE_URL = "http://phonein.herokuapp.com/twilios"
  
  def incoming
    # Get client by phone number
    client_phone = params['From']
    client_phone = client_phone[2..client_phone.size]  
    @client = Client.find_by_phone(client_phone)
    
    # Welcom message.
    # "Welcome to #{@client.name}'s residence."
    # Ask agent to identy him/herself.
    # "Please enter your code"
    @post_to = BASE_URL + "/validate.xml?client_id=#{@client.id}"
    render :action => "incoming.xml.builder", :layout => false
  end
  
  def validate
    @client = Client.find(params[:client_id])    
    @agent = Agent.find_by_code(params['Digits'])
    
    if @agent.nil?
      render :action => "incoming"
      return
    else
      if @agent.checked_in? 
        @message = "You have already checked in."
      else
        @agent.check_in(@client.id)
        @message = "Now you are checked in."
      end
    end 

    @post_to = BASE_URL + "/direction.xml?agent_id=#{@agent.id}&client_id=#{@client.id}"
    render :action => "direction.xml.builder", :layout => false
  end
      
  def direction    
    @client = Client.find(params[:client_id])
    @agent = Agent.find(parmas[:agent_id])
    @tasks = @client.task_list
    
    # 1 to hear the tasks again, 2 to check out.
    if params['Digits'] == '1'
      render :action => "read_tasks.xml.builder", :layout => false
      return 
    elsif parmas['Digits'] == '2'
      # if 2, "thank you for your service today."
      @agent.check_out
      render :action => 'goodbye.xml.builder', :layout => false
    end
    
  end
    
end
