xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 1) do
    xml.Say "Welcome #{@agent.name}."
    xml.Say "#{@message}"
    xml.Say "Please press 1 to read the task. Press 2 to check out. Or Press 3 to hang up."
  end
end