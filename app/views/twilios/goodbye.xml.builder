xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 1) do
    xml.Say "#{@goodbye_message}"
    xml.Say "Good-bye."
    xml.Hangup
  end
end