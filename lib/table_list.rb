class TableList 
  def initialize(instance)
    @instance = instance
  end
  
  def sortable_headers(columns=[], widths={})
    @instance.content_tag :tr do
      @instance.get_sortable_table_headers(columns, widths)
    end
  end
  
  def headers(columns=[], widths={})
    @instance.content_tag :tr do
      @instance.get_table_headers(columns, widths)
    end
  end
  
  def td(data)
    @instance.content_tag :td, data
  end

  def tr(&block)
    raise "need a block" unless block_given?

    @instance.content_tag(:tr, block.call(self))
  end
end