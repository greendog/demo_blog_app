namespace :elasticsearch do
  desc "Reindex Post model"
  task :reindex do
    Post.reindex
  end
end

