class CommentNewsController < ApplicationController
  before_action :set_comment_news, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /comment_news or /comment_news.json
  def index
    @comment_news = CommentNews.all
  end

  # GET /comment_news/1 or /comment_news/1.json
  def show
  end

  # GET /comment_news/new
  def new
    @anime_news = AnimeNews.find_by(id: params[:anime_news_id])
    session[:anime_news_id] = @anime_news.id
    @comment_news = CommentNews.new
  end

  # GET /comment_news/1/edit
  def edit
  end

  # POST /comment_news or /comment_news.json
  def create
    @comment_news = CommentNews.new(comment_news_params)

    respond_to do |format|
      if @comment_news.save
        format.html { redirect_to '/anime_news/'+session[:anime_news_id].to_s, notice: "Comment news was successfully created." }
        format.json { render :show, status: :created, location: @comment_news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_news/1 or /comment_news/1.json
  def update
    respond_to do |format|
      if @comment_news.update(comment_news_params)
        format.html { redirect_to @comment_news, notice: "Comment news was successfully updated." }
        format.json { render :show, status: :ok, location: @comment_news }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_news/1 or /comment_news/1.json
  def destroy
    @comment_news.destroy
    respond_to do |format|
      format.html { redirect_to '/anime_news/'+session[:anime_news_id].to_s, notice: "Comment news was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_news
      @comment_news = CommentNews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_news_params
      params.require(:comment_news).permit(:user_id, :anime_news_id, :msg)
    end
end
