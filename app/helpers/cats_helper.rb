module CatsHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "create"
      confirm_cats_path
    elsif action_name == "edit"
      cat_path
    end
  end
end
