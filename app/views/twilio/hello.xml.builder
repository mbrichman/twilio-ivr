xml.instruct!
xml.Response do
  xml.pause length: 5
  # xml.Say "Hello, #{@name}."
    xml.Say "Hello Mark"
    # xml.Gather(:action => hello_options_path, :numDigits => 1) do
      # xml.Say "Press 1 to do this, or press 2 to do that."
    end
end
