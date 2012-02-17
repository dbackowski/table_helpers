class TableData < ActionView::Base
  @label_size = nil
  @set_label_size = false
  
  def initialize(label_size)
    @label_size = label_size
  end
  
  def row(label, data, colspan=false)
    data = data.to_s.html_safe
    label = label.to_s.html_safe

    unless @set_label_size && @label_size
      unless colspan
        result = content_tag :tr do
          content_tag(:td, label, :class => "label", :width => @label_size) <<
          content_tag(:td, data)
        end
      else
        result = content_tag :tr do
          content_tag(:td, content_tag(:span, label, :class => "label", :style => "display: block; float: left; width: #{@label_size}px;") << data, :colspan => 2, :width => @label_size)
        end
      end
      
      @set_label_size = true
    else
      unless colspan
        result = content_tag :tr do
          content_tag(:td, label, :class => "label") <<
          content_tag(:td, data)
        end
      else
        result = content_tag :tr do
          content_tag(:td, content_tag(:span, label, :class => "label", :style => "display: block; float: left; width: #{@label_size}px;") << data, :colspan => 2, :width => @label_size)
        end
      end
    end
    
    result
  end
  
  def section(name=nil)
    name = name.to_s.html_safe
    
    if name.present?
      content_tag :tr do
        content_tag :td, content_tag(:div, name, :class => "section"), :colspan => 2
      end
    else
      content_tag :tr do
        content_tag :td, tag(:hr, :class => "section"), :colspan => 2
      end
    end
  end
end
