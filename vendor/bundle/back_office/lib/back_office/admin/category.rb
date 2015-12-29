ActiveAdmin.register Category do
  menu if: proc { can? :manage, Category }, label: I18n.t('admin.models.category.many')

  permit_params :title, :slug, :parent_id

  filter :title

  controller do
    helper BackOffice::Engine.helpers
  end

  index do
    selectable_column
    column :title
    column :slug
    column :post_count
    column :parent
    actions
  end

  show do
    attributes_table do
      row :title
      row :slug
      row :parent
      row :created_at
      row :updated_at
      row :post_count do
        category.post_count
      end
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs I18n.t('admin.category_form_title') do
      f.input :parent_id, as: :select, collection: categories_tree_view(category: f.object), :include_blank => false, input_html: {
          style: 'width: 75%'
      }
      f.input :title
    end
    f.actions
  end

end
