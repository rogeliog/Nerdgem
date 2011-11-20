module TutorialHelper
  def clear_after_tutorial?
    (params[:controller] == 'tutorials' and    params[:action] == 'index')    or 
    (params[:controller] == 'users'     and    params[:action] == 'show')
  end

end
