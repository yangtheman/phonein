xml.instruct!
xml.Response do
  xml.Say "#{@goodbye_message}"
  xml.Say "Good-bye."
  xml.Hangup
end