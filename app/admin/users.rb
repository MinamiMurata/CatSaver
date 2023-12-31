ActiveAdmin.register User do
  permit_params do
    if current_user.admin?
      params = %i[name email introduction image role sign_in_count last_sign_in_at created_at updated_at is_deleted deleted_at]
    elsif current_user.guest_admin?
      params = %i[name introduction image role sign_in_count last_sign_in_at created_at updated_at is_deleted deleted_at]
    end
  end

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :name
    column :email if current_user.admin?
    column :role, :text, &:role_i18n
    column :last_sign_in_at
    column :is_deleted
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :name
      row :email if current_user.admin?
      row :introduction
      row "猫数" do |user|
        user.cats.count
      end
      row "体験記数" do |user|
        user.blogs.count
      end
      row :image do
        image_tag(user.image.url, class: "main_icon") if user.image?
      end
      row :role, :text, &:role_i18n
      row :last_sign_in_at
      row :sign_in_count
      row :is_deleted
      row :deleted_at
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # 一覧ページの検索条件
  filter :name
  filter :email, if: proc { current_user.admin? }
  filter :role, as: :select, collection: User.roles_i18n.invert.map { |k, v| [k, User.roles[v]] }
  filter :last_sign_in_at
  filter :sign_in_count
  filter :is_deleted
  filter :created_at

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :introduction
      f.input :image, hint: (f.image_tag(f.user.image.url, class: "main_icon") if f.user.image?)
      f.input :image_cache, as: :hidden
      f.input :role, as: :select, collection: User.roles_i18n.invert
      f.input :password
      f.input :password_confirmation
      f.input :is_deleted
    end
    f.actions
  end
end
