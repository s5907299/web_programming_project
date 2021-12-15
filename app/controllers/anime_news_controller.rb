class AnimeNewsController < ApplicationController
  before_action :set_anime_news, only: %i[ show edit update destroy ]
  before_action :has_session

  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /anime_news or /anime_news.json
  def index
    @anime_news = AnimeNews.all
  end

  # GET /anime_news/1 or /anime_news/1.json
  def show
    @comments = CommentNews.where(anime_news_id:params[:id])
    session[:path] = '/anime_news/' + @anime_news.id.to_s
  end

  # GET /anime_news/new
  def new
    @anime_news = AnimeNews.new
  end

  # GET /anime_news/1/edit
  def edit
  end

  # POST /anime_news or /anime_news.json
  def create
    @anime_news = AnimeNews.new(anime_news_params)

    respond_to do |format|
      if @anime_news.save
        format.html { redirect_to @anime_news, notice: "Anime news was successfully created." }
        format.json { render :show, status: :created, location: @anime_news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anime_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anime_news/1 or /anime_news/1.json
  def update
    respond_to do |format|
      if @anime_news.update(anime_news_params)
        format.html { redirect_to @anime_news, notice: "Anime news was successfully updated." }
        format.json { render :show, status: :ok, location: @anime_news }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anime_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anime_news/1 or /anime_news/1.json
  def destroy
    @anime_news.destroy
    respond_to do |format|
      format.html { redirect_to anime_news_index_url, notice: "Anime news was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime_news
      @anime_news = AnimeNews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anime_news_params
      params.require(:anime_news).permit(:headline, :context)
    end
end
