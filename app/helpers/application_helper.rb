module ApplicationHelper
  def notice_trans(msg)
    msg.to_s == "alert" || msg.to_s == "error" ? "alert-message error" : "alert-message success"
  end

  def set_active(target, array)
    max = array.first
    array.each { |a| max = a if a.size > max.size }
    if max.first.class.to_s == target or (max.size.zero? and  target == 'Tutorial')
      "active" 
    end
  end


end
