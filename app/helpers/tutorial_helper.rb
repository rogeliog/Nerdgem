module TutorialHelper
  def clear_after_tutorial?
    (params[:controller] == 'tutorials' and    params[:action] == 'index')    or 
    (params[:controller] == 'tutorials' and    params[:action] == 'find')    or 
    (params[:controller] == 'users'     and    params[:action] == 'show')
  end

  def add_point? tutorial
    (request.path == tutorial_path(tutorial) && current_user && !current_user.added_point(tutorial))
  end

end
