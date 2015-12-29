FactoryGirl.define do
  factory :comment, :class => Comment do
    name "Joe Commenter"
    sequence(:email) { |n| "person#{n}@example.com" }
    body "Which one is the best for picking up new shoes?"
    association :post, :factory => :post

    trait :unmoderated do
      state 'unmoderated'
    end

    trait :approved do
      state 'approved'
    end

    trait :rejected do
      state 'rejected'
    end

    factory :unmoderated_comment, :traits => [:unmoderated]
    factory :approved_comment, :traits => [:approved]
    factory :rejected_comment, :traits => [:rejected]
  end
end