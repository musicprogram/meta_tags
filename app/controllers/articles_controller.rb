class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    set_meta_tags title: @article.name,
                  site: 'Image Blog',
                  reverse: true,
                  description: @article.summary,
                  keywords:  Faker::Lorem.words(4),
                   twitter: {
                    card: "summary",
                    site: "@crazycatlady",
                    title: "Crazy About Cats",
                    description:  @article.summary,
                    image: 'http://lorempixel.com/320/240/cats'
                  },og: {
                          title:    "Cat Blog",
                          description: @article.summary,
                          type:     'website',
                          url:      article_url(@article),
                          image:    'http://lorempixel.com/320/240/cats'
                        },
                        alternate: [
                          { href: 'http://example.fr/base/url', hreflang: 'fr' },
                          { href: 'http://example.com/feed.rss', type: 'application/rss+xml', title: 'RSS' }
                        ]
                  
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :image, :keywords, :summary, :content)
    end
end
