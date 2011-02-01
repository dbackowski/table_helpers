module TableListHelper
  def get_table_headers(columns=[], widths={})
    headers = []

    i = 1

    for column_name in columns
      if widths.has_key?(i)
        headers.push(content_tag(:th, column_name, :width => widths[i]))
      else
        headers.push(content_tag(:th, column_name))
      end
      i += 1
    end

    return headers
  end

  def get_sortable_table_headers(columns=[], widths={})
    headers = []

    p = params
    i = 1

    for j in 0 .. columns.length - 1
      column_name = columns[j][0]
      sort_columns = columns[j][1..columns[j].length-1]

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

      i += 1
      j += 1
    end

    return headers
  end

  def table_list(html_options = {}, &block)
    raise "need a block" unless block_given?

    result = capture do
      content_tag :table, html_options do
        block.call(self)
      end
    end

    concat(result)
  end

  def sortable_headers(columns=[], widths={})
    content_tag :tr do
      get_sortable_table_headers(columns, widths)
    end
  end
  
  def headers(columns=[], widths={})
    content_tag :tr do
      get_table_headers(columns, widths)
    end
  end
  
  def td(data)
    content_tag :td, data
  end

  def tr(&block)
    raise "need a block" unless block_given?

    content_tag(:tr, block.call(self))
  end
end
