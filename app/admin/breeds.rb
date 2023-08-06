ActiveAdmin.register Breed do
  permit_params :name

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # 一覧ページの検索条件
  filter :name

  # 新規作成/編集ページ
  form do |f|
    f.inputs { f.input :name }
    f.actions
  end
end
