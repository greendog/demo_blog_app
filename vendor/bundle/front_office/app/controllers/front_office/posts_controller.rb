require_dependency "front_office/application_controller"

module FrontOffice
  class PostsController < ApplicationController

    def index
      @grid = PostsGrid.new((params[:posts_grid] || {}).merge(search_term: params[:search].try(:[], :term))) do |scope|
        scope.page(params[:page])
      end

      if params[:search]
        ids = fulltext_search(params[:search][:term])

        @grid.scope do |scope|
          scope.where(id: ids)
        end
      end
    end

    def show
      @post = Post.find(params[:id])
      @comment = Comment.new
    end

    private

    def fulltext_search(term)
      Post.search(term).map{|item| item.id }
    end
  end
end
