xml.instruct!
xml.Response do
  xml.pause length: 5
    xml.Gather(:action => hello_options_path(id: params[:id]), :numDigits => 1) do
      xml.Say "Hello #{@name}. The times are from #{@start} to #{@end}", voice: 'alice'
      xml.Say "You may enter your choice at any point during this message.
        Press 1 to accept the appointment at #{@start},
        press 2 to accept the appointment at #{@end},
        press 3 to enter a specific time,
        press 4 to decline this appointment or,
        press 5 to hear these options again.
        You may also connect to your PrettyQuick dashboard to accept or decline this appointment.", voice: 'alice'
    end
end
