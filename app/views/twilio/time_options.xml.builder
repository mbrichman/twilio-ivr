xml.instruct!
xml.Response do
  xml.Gather(:action => hello_times_path(id: params[:id]), :numDigits => 4) do
    xml.Say "Please enter the time you can accept the appointment as a 4 digit number representing the time. For example, enter 1 0 1 5 for 10:15am.", voice: 'alice'
    end
end
