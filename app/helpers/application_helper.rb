module ApplicationHelper
  def title
    if @title
      title = "RailsBB | #{@title}"
    else
        title = "RailsBB" 
    end
  end

  def logo
    image_tag 'logo.png', :title => 'logo'
  end

  def path(forum)
    path = Array.new 
    #path << link_to('Board index', forums_path)
    if (forum && forum.respond_to?(:parent))
      while(forum.parent)
        path << link_to(forum.name, forum)
        forum = forum.parent
      end
    end
    path.reverse!
    path.insert(0, link_to('Board index', forums_path))
    return path.join(' < ')
  end
  
  def admin?
    true
  end

end
