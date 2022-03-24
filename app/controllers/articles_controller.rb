class ArticlesController < ApplicationController
    def main
    end
    def show
        @article = Article.find(params[:id])
    end
end