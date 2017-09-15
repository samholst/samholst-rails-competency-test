module ApplicationHelper

  def crud_access
    ["AdminUser", "EditorUser"]
  end

  def alerts
    alert = (flash[:alert] || flash[:notice] || flash[:error])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Alert!", sticky: false)
  end
end
