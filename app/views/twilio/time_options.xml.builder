xml.instruct!
xml.Response do
  xml.Gather(:action => hello_options_path(id: params[:id], 'Digits' => '3'), :numDigits => 4) do
    xml.Say "Please enter the time you can accept the appointment as a 4 digit number representing the time. For example, enter 1 0 1 5 for 10:15am.", voice: 'alice'
    end
end
