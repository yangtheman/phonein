xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 6) do  
    xml.Say "Agent could not be found. Please enter your 6 digit code."
  end
end