ActiveAdmin.register User do
  permit_params :name, :email, :introduction, :image, :role, :sign_in_count, :last_sign_in_at, :created_at, :updated_at

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :name
    column :email
    column :role, :text, &:role_i18n
    column :last_sign_in_at
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :name
      row :email
      row :introduction
      row :image
      row :role, :text, &:role_i18n
      row :last_sign_in_at
      row :sign_in_count
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # 一覧ページの検索条件
  filter :name
  filter :email
  filter :role, as: :select, collection: I18n.t(User.roles.keys)
  filter :last_sign_in_at
  filter :sign_in_count
  filter :created_at

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :introduction
      f.input :image
      f.input :role, as: :select, collection: I18n.t(User.roles.keys)
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
