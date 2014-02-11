xml.instruct!
xml.Response do
  xml.pause length: 5
    # xml.Say "Hello #{@name}. The times are from #{@start} to #{@end}"
    xml.Say "Hello #{@name}. This is your robot monkey Reginald. Do you love me?"
    xml.Gather(:action => hello_options_path(id: params[:id]), :numDigits => 1) do
      # xml.Say "Press 1 to accept the appointment at #{@start} or press 2 to accept the appointment at #{@end}."
      xml.Say "Press 1 if you do. Otherwise press 2."
    end
end
