class LikeAnimesController < ApplicationController
  before_action :set_like_anime, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /like_animes or /like_animes.json
  def index
    @like_animes = LikeAnime.all
  end

  # GET /like_animes/1 or /like_animes/1.json
  def show
  end

  # GET /like_animes/new
  def new
    @like_anime = LikeAnime.new
  end

  # GET /like_animes/1/edit
  def edit
  end

  # POST /like_animes or /like_animes.json
  def create
    @like_anime = LikeAnime.new(like_anime_params)

    respond_to do |format|
      if @like_anime.save
        format.html { redirect_to @like_anime, notice: "Like anime was successfully created." }
        format.json { render :show, status: :created, location: @like_anime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like_anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /like_animes/1 or /like_animes/1.json
  def update
    respond_to do |format|
      if @like_anime.update(like_anime_params)
        format.html { redirect_to @like_anime, notice: "Like anime was successfully updated." }
        format.json { render :show, status: :ok, location: @like_anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like_anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /like_animes/1 or /like_animes/1.json
  def destroy
    @like_anime.destroy
    respond_to do |format|
      format.html { redirect_to like_animes_url, notice: "Like anime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like_anime
      @like_anime = LikeAnime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_anime_params
      params.require(:like_anime).permit(:user_id, :anime_id)
    end
end
