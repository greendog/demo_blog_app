class PostsGrid

  include Datagrid

  attr_accessor :search_term

  scope do
    Post.live.includes(:categories, :tags)
  end

  filter(:title, :string, :header => "Заголовок")
  filter(:category_ids, :enum, :header => "Категории",
         :select => lambda { Category.pluck(:title, :id) },
         :multiple => true,
         :include_blank => false
  ) do |value|
    self.joins(:categories).where(:categories => {:id => value})
  end

  filter(:tag_ids, :enum, :header => "Теги",
         :select => lambda { ::ActsAsTaggableOn::Tag.pluck(:name, :id) },
         :multiple => true,
         :include_blank => false
  ) do |value|
    self.joins(:tags).where(:tags => {:id => value})
  end

  column(:title, :header => "Заголовок", :order => false, :html => true) do |record|
    link_to record.title, post_path(record)
  end
  column(:body, :header => "Сообщение", :order => false, :html => true) do |record, grid|
    highlight record.body, grid.search_term
  end
  column(:created_at, :header => "Дата создания") do |model|
    model.created_at.to_date
  end
end
