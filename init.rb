require 'app/helpers/table_data_helper'
require 'app/helpers/table_list_helper'

ActionView::Base.send :include, TableDataHelper
ActionView::Base.send :include, TableListHelper