xml.instruct!
xml.Response do
  xml.pause length: 5
    xml.Say "Hello #{@name}. The times are from #{@start} to #{@end}"
    xml.Gather(:action => hello_options_path(id: params[:id]), :numDigits => 1) do
      xml.Say "Press 1 to accept the appointment at #{@start}."
    end
end
