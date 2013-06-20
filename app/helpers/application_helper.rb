module ApplicationHelper
  def pagination_links(pages)
    will_paginate(pages, class: 'pagination',
                         previous_label: '&lt;'.html_safe,
                         next_label: '&gt;'.html_safe,
                         inner_window: 1,
                         outer_window: 0)
  end
end
