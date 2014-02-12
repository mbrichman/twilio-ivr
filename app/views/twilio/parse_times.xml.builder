xml.instruct!
xml.Response do
  xml.pause length: 5
    xml.Say "Yabba dabba doo!", voice: 'alice'
    # xml.Gather(:action => hello_times_path, :numDigits => 4) do
    #   xml.Say 'Hello'
    # end
end
