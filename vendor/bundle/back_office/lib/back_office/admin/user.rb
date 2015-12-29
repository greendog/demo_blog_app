ActiveAdmin.register User do
  menu  if: proc { can? :manage, User }, label: I18n.t('admin.models.user.many')

  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    column :role
    column :email
    column :sign_in_count
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs I18n.t('admin.user_form_title') do
      f.input :role, as: :select, collection: User.role.options
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
