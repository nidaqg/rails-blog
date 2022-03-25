class ArticlesController < ApplicationController
    #to display the article cxorresponding to the id in the url
    def show
        @article = Article.find(params[:id])
    end
    #main page that displays all the articles
    def index
        @articles = Article.all
    end
    #page where new article gets created and saved to a variable. initialize the 
    # variable so if it errors out and relouds theres no error on page
    def new
        @article = Article.new
    end
    # page for editing article
    def edit
        @article = Article.find(params[:id])
    end
    #create method to save created article to db, redirect to diff page
    def create
      @article = Article.new(params.require(:article).permit(:title, :description))
      if @article.save
        flash[:notice] = "Article was created successfully."
      redirect_to @article
      else
        render 'new'
      end
    end
    # update exisitng article in db
    def update
        @article = Article.find(params[:id])
         if @article.update(params.require(:article).permit(:title, :description))
         flash[:notice] = "Article was updated successfully!"
         redirect_to @article
        else
            render 'edit'
         end
    end
end