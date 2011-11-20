module ApplicationHelper
  def notice_trans(msg)
      msg.to_s == "alert" || msg.to_s == "error" ? "alert-message error" : "alert-message success"
  end
end
