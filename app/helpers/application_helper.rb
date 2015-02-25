module ApplicationHelper
  def sortable_user(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, users_path(sort: column, direction: direction), :remote => true, class: css_class
  end

  def sortable_admin(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, admin_admins_path(sort: column, direction: direction), :remote => true, class: css_class
  end
end
