xml.instruct!
xml.Response do
  xml.Say "You entered #{@message}", voice: 'alice'
  xml.pause length: "50"
  xml.Say "Done pausing"
end
