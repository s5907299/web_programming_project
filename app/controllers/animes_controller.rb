class AnimesController < ApplicationController
  before_action :set_anime, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /animes or /animes.json
  def index
    @animes = Anime.all
  end

  # GET /animes/1 or /animes/1.json
  def show
    #@platforms = Platform1.all
    @comments = CommentAnime.where(anime_id:params[:id])
    @platforms = Platform1.where(:id => Source0.where(anime_id:params[:id]).pluck("platform1_id"))
    session[:path] = '/animes/' + @anime.id.to_s
  end

  # GET /animes/new
  def new
    @anime = Anime.new
  end

  # GET /animes/1/edit
  def edit
  end

  # POST /animes or /animes.json
  def create
    @anime = Anime.new(anime_params)
    respond_to do |format|
      if anime_params[:day_in_week]=="" or anime_params[:episode] == ""
        format.html { redirect_to '/animes/new', alert: "Anime was not successfully created." }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      elsif Integer(anime_params[:day_in_week]) < 0 or Integer(anime_params[:day_in_week]) > 6 or Integer(anime_params[:episode]) <= 0 
        format.html { redirect_to '/animes/new', alert: "Anime was not successfully created." }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      else @anime.save
        format.html { redirect_to @anime, notice: "Anime was successfully created." }
        format.json { render :show, status: :created, location: @anime }
      end
    end
  end

  # PATCH/PUT /animes/1 or /animes/1.json
  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to @anime, notice: "Anime was successfully updated." }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1 or /animes/1.json
  def destroy
    @anime.destroy
    respond_to do |format|
      format.html { redirect_to animes_url, notice: "Anime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anime_params
      params.require(:anime).permit(:name, :synosis, :day_in_week, :show_time, :on_air, :episode)
    end
end
