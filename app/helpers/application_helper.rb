# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def boolean_icon_tag(state)
    if state
      image_tag("icons/tick.png")
    else
      image_tag("icons/cross.png")
    end
  end

  def paginate_navigation
    result = "<ul>"
    
    result << "<li>"
    result << "<a href='?page=#{@pn_current - 1}'>" if @pn_current > 1
    result << "Previous"
    result << "</a>" if @pn_current > 1
    result << "</li>"
    
    (1..@pn_pages).each do |i|
      result << "<li>"
      
      if @pn_current == i
        result << "<a href='?page=#{i}' class='active'>"
      else
        result << "<a href='?page=#{i}'>"
      end
      
      result << i.to_s
      result << "</a>"
      result << "</li>" 
    end
    
    result << "<li>"
    result << "<a href='?page=#{@pn_current + 1}'>" if @pn_current < @pn_pages
    result << "Next"
    result << "</a>" if @pn_current < @pn_pages
    result << "</li>"
    
    result << "</ul>"
    return result
  end

end