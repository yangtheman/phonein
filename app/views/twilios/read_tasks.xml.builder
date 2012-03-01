xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 1) do  
    xml.Say "Welcome #{@agent.name}"
    xml.Say "#{@tasks}"
    xml.Say "Please press 1 to repeat the task. Or Press 2 to hang up."
  end
end