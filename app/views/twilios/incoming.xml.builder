xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to, :numDigits => 6) do
    xml.Say "Welcome to #{@client.name}'s residence."
    xml.Say "Please enter your six digit code."
  end
end