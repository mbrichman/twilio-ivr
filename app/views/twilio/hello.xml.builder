xml.instruct!
xml.Response do
  xml.pause length: 5
  xml.Say "Hello, #{@name}."
    xml.Gather(:action => @post_to, :numDigits => 1) do
      xml.Say "Press 1 to do this, or press 2 to do that."
    end
end
