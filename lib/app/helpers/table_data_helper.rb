module TableDataHelper
  def table_data(options = {}, &block)
    options[:label_size] ||= nil

    t = TableData.new(options[:label_size])

    result = content_tag(:table, :class => 'info') do
      block.call(t)
    end

    concat(result)
  end

  class TableData < ActionView::Base
    @label_size = nil
    @set_label_size = false

    def initialize(label_size)
      @label_size = label_size
    end

    def row(label, data, colspan=false)
      unless @set_label_size && @label_size
        unless colspan
          result = content_tag :tr do
            content_tag(:td, label, :class => "label", :width => @label_size) <<
              content_tag(:td, data)
          end
        else
          result = content_tag :tr do
            content_tag(:td, content_tag(:span, label, :class => "label") << data, :colspan => 2, :width => @label_size)
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
            content_tag(:td, content_tag(:span, label, :class => "label") << data, :colspan => 2, :width => @label_size)
          end
        end
      end

      return result
    end

    def section(name=nil)
      unless name.nil?
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
end
