require 'test_helper'
require 'action_view'
require 'action_controller'
require 'action_view/test_case'
require File.dirname(__FILE__) + '/../lib/table_data.rb'
require File.dirname(__FILE__) + '/../lib/table_list.rb'
require File.dirname(__FILE__) + '/../lib/table_helpers.rb'

class TableHelpersTest < ActionView::TestCase
  include TableHelpers

  test "table_list_helper_with_headers" do
    result = table_list(:class => 'list') do |t|
      t.headers(['Column 1', 'Column 2']) +
      t.tr do |tr|
        tr.td('Example 1') +
        tr.td('Example 2', :class => 'options')
      end +
      t.tr do |tr| 
        tr.td('Example 3') +
        tr.td('Example 4', :class => 'options')
      end
    end

    expected = '<table class="list">'
    expected << '<tr><th>Column 1</th><th>Column 2</th></tr>'
    expected << '<tr><td>Example 1</td><td class="options">Example 2</td></tr>'
    expected << '<tr><td>Example 3</td><td class="options">Example 4</td></tr>'
    expected << '</table>'

    assert_dom_equal expected, result
  end

  test "table_data_helper" do
    result = table_data(:label_size => 200) do |t|
      t.row('Firm:', 'Test') +
        t.section +
        t.row('Client Name:', 'Bill Gates')
    end

    expected = '<table class="info">'
    expected << '<tr><td class="label" width="200">Firm:</td><td>Test</td></tr>'
    expected << '<tr><td colspan="2"><hr class="section" /></td></tr>'
    expected << '<tr><td class="label">Client Name:</td><td>Bill Gates</td></tr>'
    expected << '</table>'

    assert_dom_equal expected, result
  end
end
