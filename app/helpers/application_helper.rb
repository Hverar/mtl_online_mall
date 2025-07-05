module ApplicationHelper
  def hide_navbar?
    (
      devise_controller? && controller_name.in?(%w[sessions registrations passwords])
    ) || (
      controller.controller_name == "pages" && controller.action_name == "searchbar"
    )
  end
end
