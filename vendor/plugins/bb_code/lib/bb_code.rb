# BbCode

class String
  def bb_to_html
    @@bbtags ||=  get_tags
    @@bbtags.each_pair { | bb, htm | 
      self.gsub!(bb,htm)
      }
      return self
  end
  
  #bbcode tags and html equivalent
  def get_tags
    tags = {}
    #bold
    tags[/\[b\](.*?)\[\/b\]/i] = '<strong>\\1</strong>'
    #italic
    tags[/\[i\](.*?)\[\/i\]/i] = '<i>\\1</i>'  
    #underlined
    tags[/\[u\](.*?)\[\/u\]/i] = '<u>\\1</u>'
    #exposant
    tags[/\[sup\](.*?)\[\/sup\]/i] = '<sup>\\1</sup>'
    #indice
    tags[/\[sub\](.*?)\[\/sub\]/i] = '<sub>\\1</sub>'
    #img
    tags[/\[img\](.*?)\[\/img\]/i] = '<img src="\\1" />'
    #color
    tags[/\[color=#([0-9a-f]*)\](.*?)\[\/color\]/i] = "<span style=\"color:#\\1;\">\\2</span>"
    #lists
    tags[/\[ul\](.*?)\[\/ul\]/i] = '<ul>\\1</ul>'
    tags[/\[li\](.*?)\[\/li\]/i] = '<li>\\1</li>'
    #link
    tags[/\[url=(.*?)\](.*?)\[\/url\]/i] = '<a href=\\1>\\2</li>'
    return tags
  end
  
end