ActiveAdmin.register Blog do
  permit_params :title, :content, :disease_name, :age_range, :user_id, :cat_id, images: []

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :title
    column :content
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :title
      row :content
      row :images do
        div { blog.images.each { |img| div { image_tag url_for(img), height: "200" } } }
      end
      row :disease_name
      row :age_range, :text, &:age_range_i18n
      row :user_id
      row :cat_id
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  # 一覧ページの検索条件
  filter :title
  filter :content
  filter :disease_name
  filter :age_range, as: :select, collection: Blog.age_ranges_i18n.invert.map { |k, v| [k, Blog.age_ranges[v]] }
  filter :created_at

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :images, as: :file, input_html: { multiple: true }
      f.input :disease_name
      f.input :age_range, as: :select, collection: Blog.age_ranges_i18n.invert
      f.input :user_id
      f.input :cat_id
    end
    f.actions
  end
end
