class ArticlesController < ApplicationController

  before_action :set_breaking_news, :only=>[:show, :category]

  def show
    @article = Article.find(params[:id] )
    @author = @article.user
    @category = @article.category
  end

  def category
    @category = params[:category]
    @category_articles = Article.where( :category => params[:category] )
                        .order('created_at desc')
  end

  def new

    if not user_signed_in?
      redirect_to root_path
      flash[:notice] = "You must be logged into create an article"
      return
    end

    @article = Article.new
  end

  def create
    @article = Article.new( article_params )
    @article.save
    #above 2 lines same as Article.create( article_params )

    if @article.save
      redirect_to article_path(@article)
    else
      render 'new.html.erb'
      #this is better than redirect as it just doesnt reopen a fresh page - content already written remains
    end
  end

  def index
    @homepage_article_items = Article.order('created_at desc').paginate(:page => params[:page]).limit(5)
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end


  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    if @article.save
      redirect_to article_path(@article)

    else
      render 'edit.html.erb'
      #this is better than redirect as it just doesnt reopen a fresh page - content already written remains
    end
  end

  private
    def article_params
      params.require(:article).permit(:content,:title,:author,:category)
    end

  def set_breaking_news
    @breaking_news_items = Article.order('created_at desc').limit(5)
  end

end
