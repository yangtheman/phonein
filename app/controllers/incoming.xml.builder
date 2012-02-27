xml.instruct!
xml.Response do
  xml.Gather(:action => @post_to) do
    xml.Say "Welcome to #{@client.name}'s residence."
    xml.Say "Please enter your code."
  end
end