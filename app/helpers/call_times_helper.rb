module CallTimesHelper

  def def_ovr
    @button_status=[]
    if @current_phone.call_time.default_override == false
      @button_status << true << false << false
    elsif @current_phone.call_time.default_override == true && @current_phone.call_time.default_start1.to_s.sub(/.{11}/,'')=="00:00:00 UTC"
      @button_status << false << true << false
    else
      @button_status << false << false << true
    end
    return @button_status
  end 

end
