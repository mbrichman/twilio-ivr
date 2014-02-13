xml.instruct!
xml.Response do
  if @message[:error]
    xml.Say "#{@message[:error]}", voice: 'alice'
    url = hello_options_url(id: params[:id])
    xml.Redirect url, method: 'post'
  else
    xml.Gather(:action => hello_confirm_path(id: params[:id], time: @chosen_time), :numDigits => 1) do
      xml.Say "#{@message[:text]}", voice: 'alice'
    end
  end
end
