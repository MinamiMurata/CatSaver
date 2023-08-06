ActiveAdmin.register Cat do
  permit_params :name, :introduction, :image, :birthday, :breed_id, :user_id

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :name
    column :introduction
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :name
      row :introduction
      row :image
      row :birthday
      row :breed_id
      row :user_id
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # 一覧ページの検索条件
  filter :name
  filter :breed_id, as: :select
  filter :created_at

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :name
      f.input :introduction
      f.input :image
      f.input :birthday
      f.input :breed_id
      f.input :user_id
    end
    f.actions
  end
end
