FactoryGirl.define do
  factory :post, :class => Post do
    sequence(:title) { |n| "Top #{n} Shopping Centers in Chicago" }
    body "These are the top ten shopping centers in Chicago. You're going to read a long blog post about them. Come to peace with it."
    draft false
    published_at Time.now

    factory :post_draft do
      draft true
    end
  end
end