ActiveAdmin.register Post do
  menu if: proc { can? :manage, Post }, label: I18n.t('admin.models.post.many')

  filter :title
  filter :draft
  filter :body
  filter :tags
  filter :categories

  scope(I18n.t('admin.all'), default: true) { |posts| posts }
  scope(I18n.t('activerecord.attributes.post.live')) { |posts| posts.live }
  scope(I18n.t('activerecord.attributes.post.drafts')) { |posts| posts.drafts }

  permit_params :title, :body, :published_at, :draft, category_ids: [], tag_list: [], comments_ids: []

  controller do
    helper BackOffice::Engine.helpers

    def autocomplete_tags
      @tags = ActsAsTaggableOn::Tag.where("name LIKE :search", search: "#{params[:q][:term]}%").order(:name)
      render :json => @tags.collect { |t| {:id => t.name, :name => t.name} }
    end
  end

  index do
    selectable_column
    column :title
    column :draft
    actions
  end

  form do |f|
    f.semantic_errors
    tabs do
      tab I18n.t('admin.main_fields') do
        f.inputs I18n.t('admin.post_form_title') do
          f.input :title
          f.input :body, input_html: {rows: 10}
          f.input :published_at, :as => :date_select
          f.input :categories, :as => :select, collection: categories_tree_view(categories: f.object.categories.pluck(:id)), input_html: {
              style: 'width: 75%'
          }
          f.input :tag_list, :as => :select,
                  label: I18n.t('admin.models.tag.many'),
                  input_html: {
                     class: 'tags-select form-control', multiple: 'multiple', style: 'width: 75%'
                  }, collection: f.object.tags.map{|tag| [tag.name, tag.name, {selected: 'selected'}]}
          f.input :draft
        end

      end
      tab I18n.t('activerecord.attributes.post.comments') do
        f.inputs I18n.t('admin.advanced_details') do
          f.has_many :comments, heading: I18n.t('activerecord.attributes.post.comments'), new_record: false,  allow_destroy: true do |comment|
            comment.input :name
            comment.input :state
            comment.input :email
            comment.input :body, input_html: {rows: 5}
          end
        end
      end
    end

    f.actions
  end
end
