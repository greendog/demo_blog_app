FactoryGirl.define do
  factory :category, :class => Category do
    sequence(:title) { |n| "Shopping #{n}" }
  end
end