module ActiveAdmin::ViewsHelper
  def categories_tree_view args = {}
    category = args.try(:[], :category)
    categories = args.try(:[], :categories)
    ari = Category.all.each do |c|
      c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? '/' : '') + c.id.to_s
    end.sort do |x, y|
      x.ancestry <=> y.ancestry
    end.map do |c|
      [' -- ' * (c.depth - 1) + c.title, c.id]
    end

    result = content_tag(:option, value: nil){ "-- #{I18n.t(:none)} --" }
    ari.each do |item|
      id = item[1]

      (disabled = 'disabled' if id.eql?(category.id) or (!category.new_record? and category.try(:child_ids).include?(id))) if category

      (selected = 'selected' if categories.include? id) if categories

      result << content_tag(:option, value: id, disabled: disabled, selected: selected) do
        item[0]
      end
    end
    result.html_safe
  end
end