# TableHelpers

Rails 3.x table helpers plugin.

## Examples

table_list:

```ruby
<%= table_list :class => 'list' do |t| %>
  <%= t.headers ['First column', 'Second column'] %>
    <%= t.tr do |tr| %>
      <%= tr.td 'Example 1' %>
      <%= tr.td 'Example 2', :class => 'options' %>
    <% end %>
<% end %>
```

HTML output:

```html
<table class="list">
  <tr>
    <th>First column</th>
    <th>Second column</th>
  </tr>
  <tr>
    <td>Example 1</td>
    <td class="options">Example 2</td>
  </tr>
</table>
```

table_data:

```ruby
<%= table_data :label_size => 150 do |t| %>
  <%= t.row 'Label name:', 'Data' %>
  <%= t.section 'Next section:' %>
  <%= t.row 'Label name 2:', 'Data 2' %>
<% end %>
```

HTML output:

```html
<table class="info">
  <tr>
    <td class="label" width="150">Label name:</td>
    <td>Data</td>
  </tr>
  <tr>
    <td colspan="2"><div class="section">Next section:</div></td>
  </tr>
  <tr>
    <td class="label">Label name 2 :</td>
    <td class="label">Data 2:</td>
  </tr>
</table>
```

Copyright (c) 2012 Damian Baćkowski, released under the MIT license
