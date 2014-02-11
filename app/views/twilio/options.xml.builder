xml.instruct!
xml.Response do
  xml.pause length: 5
  xml.Say "You chose #{@message_id}"
end
