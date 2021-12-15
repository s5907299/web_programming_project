class LikeNewsController < ApplicationController
  before_action :set_like_news, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /like_news or /like_news.json
  def index
    @like_news = LikeNews.all
  end

  # GET /like_news/1 or /like_news/1.json
  def show
  end

  # GET /like_news/new
  def new
    @like_news = LikeNews.new
  end

  # GET /like_news/1/edit
  def edit
  end

  # POST /like_news or /like_news.json
  def create
    @like_news = LikeNews.new(like_news_params)

    respond_to do |format|
      if @like_news.save
        format.html { redirect_to @like_news, notice: "Like news was successfully created." }
        format.json { render :show, status: :created, location: @like_news }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /like_news/1 or /like_news/1.json
  def update
    respond_to do |format|
      if @like_news.update(like_news_params)
        format.html { redirect_to @like_news, notice: "Like news was successfully updated." }
        format.json { render :show, status: :ok, location: @like_news }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /like_news/1 or /like_news/1.json
  def destroy
    @like_news.destroy
    respond_to do |format|
      format.html { redirect_to like_news_index_url, notice: "Like news was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_news
      @like_news = LikeNews.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_news_params
      params.require(:like_news).permit(:user_id, :anime_news_id)
    end
end
