module ApplicationHelper

  def strftime_time(time_obj)
    time_obj.strftime('%Y-%m-%d %H:%M:%S')
  end

  def paginate_attrs(json, object)
    json.(object, :current_page, :next_page, :prev_page, :total_pages, :total_count)
  end
end
