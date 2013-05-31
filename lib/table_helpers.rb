require 'table_list'
require 'table_data'

module TableHelpers
  def get_table_headers(columns=[], widths={})
    headers = []

    i = 1

    for column_name in columns
      if widths.has_key?(i)
        headers.push(content_tag(:th, column_name, :width => widths[i]))
      else
        headers.push(content_tag(:th, column_name.html_safe).html_safe)
      end
      i += 1
    end

    headers.join.html_safe
  end

  def get_sortable_table_headers(columns=[], widths={})
    headers = []

    p = params
    i = 1

    for j in 0 .. columns.length - 1
      column_name = columns[j][0]
      sort_columns = columns[j][1..columns[j].length-1]

      if column_name.present?
        if params[:order_by] == sort_columns.join(', ')
          link = link_to(column_name, p.merge('order_by' => "#{sort_columns.join(' DESC, ') + ' DESC'}"), :class=> "sortdown")
        elsif params[:order_by] == sort_columns.join(' DESC, ') + ' DESC'
          link = link_to(column_name, p.merge('order_by' => sort_columns.join(', ')), :class=> "sortup")
        else
          link = link_to(column_name, p.merge('order_by' => sort_columns.join(', ')), :class=> "sort-none")
        end

        if widths.has_key?(i)
          headers.push("<th width=\"%s\">%s</th>" % [widths[i],link])
        else
          headers.push("<th>%s</th>" % [link])
        end
      else
        headers.push('<th></th>')
      end

      i += 1
      j += 1
    end

    headers.join.html_safe
  end

  def table_list(html_options = {}, &block)
    raise "need a block" unless block_given?
    
    t = TableList.new self
    
    result = capture do
      content_tag :table, html_options do
        block.call(t)
      end
    end
  end

  def table_data(options = {}, &block)
    options[:label_size] ||= nil

    t = TableData.new(options[:label_size])

    result = content_tag(:table, :class => 'info') do
      block.call(t)
    end
  end
end

ActionView::Base.send :include, TableHelpers
