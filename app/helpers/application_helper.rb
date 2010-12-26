module ApplicationHelper
  def title
    if @title
      title = "RailsBB | #{@title}"
    else
        title = "RailsBB" 
    end
  end

  def logo
    (link_to(image_tag('logo.png', :title => 'logo'), root_path))
  end

  def path(forum, thread = nil)
    path = Array.new 
    if thread
      path << link_to(thread.title, [thread.forum, thread])
    end
    if (forum && forum.respond_to?(:parent))
      while(forum.parent)
        path << link_to(forum.name, forum)
        forum = forum.parent
      end
    end
    path.reverse!
    path.insert(0, link_to('Board index', root_path))
    return path.join(' > ')
  end
  
  def admin?
    true
  end

end
