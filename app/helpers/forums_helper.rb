module ForumsHelper
  def last?(item, array)
    return "last" if item == array.last
    return nil
  end
end
