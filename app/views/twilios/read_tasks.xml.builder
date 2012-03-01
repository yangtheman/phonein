xml.instruct!
xml.Response do
  xml.Say "Welcome #{@agent.name}"
  xml.Say "#{@tasks}"
  xml.Say "Please press 1 to repeat the task. Or Press 2 to hang up."
end