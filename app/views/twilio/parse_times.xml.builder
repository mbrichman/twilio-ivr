xml.instruct!
xml.Response do
  xml.Say "You entered some stuff", voice: 'alice'
  xml.pause length: "50"
  xml.Say "Done pausing"
end
