class TableList
  def initialize(instance)
    @instance = instance
  end

  def sortable_headers(columns = [], widths = {})
    @instance.content_tag :tr do
      @instance.concat(@instance.get_sortable_table_headers(columns, widths))
    end
  end

  def headers(columns = [], widths = {})
    @instance.content_tag :tr do
      @instance.concat(@instance.get_table_headers(columns, widths))
    end
  end

  def td(data, html_options = {})
    @instance.content_tag :td, data.to_s.html_safe, html_options
  end

  def tr(html_options = {}, &block)
    raise "need a block" unless block_given?

    result = @instance.capture do
      @instance.content_tag :tr, html_options do
        block.call(self)
      end
    end
  end
end
