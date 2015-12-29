ActiveAdmin.register Comment do
  menu  if: proc { can? :manage, Comment }, label: I18n.t('admin.models.comment.many')

  filter :name
  filter :email
  filter :state
  filter :post

  scope(I18n.t('admin.all'), default: true) { |comments| comments }
  scope(I18n.t('activerecord.attributes.comment.unmoderated')) { |comments| comments.unmoderated }
  scope(I18n.t('activerecord.attributes.comment.approved')) { |comments| comments.approved }
  scope(I18n.t('activerecord.attributes.comment.rejected')) { |comments| comments.rejected }

  permit_params :body, :state, :email, :name

  index do
    selectable_column
    column :name
    column :state
    column :email
    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs I18n.t('admin.category_form_title') do
      f.input :name
      f.input :body
      f.input :email
      f.input :state, as: :select, collection: Comment.state.options
    end
    f.actions
  end
end
