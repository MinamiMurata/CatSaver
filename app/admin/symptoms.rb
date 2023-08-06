ActiveAdmin.register Symptom do
  permit_params :category, :detail

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :category, :text, &:category_i18n
    column :detail
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :category, :text, &:category_i18n
      row :detail
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # 一覧ページの検索条件
  filter :category, as: :select, collection: I18n.t(Symptom.categories.keys)
  filter :detail

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :category, as: :select, collection: I18n.t(Symptom.categories.keys)
      f.input :detail
    end
    f.actions
  end
end
