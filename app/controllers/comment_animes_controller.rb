class CommentAnimesController < ApplicationController
  before_action :set_comment_anime, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /comment_animes or /comment_animes.json
  def index
    @comment_animes = CommentAnime.all
  end

  # GET /comment_animes/1 or /comment_animes/1.json
  def show
  end

  # GET /comment_animes/new
  def new
    @anime = Anime.find_by(id: params[:anime_id])
    session[:anime_id] = @anime.id
    @comment_anime = CommentAnime.new
  end

  # GET /comment_animes/1/edit
  def edit
  end

  # POST /comment_animes or /comment_animes.json
  def create
    @comment_anime = CommentAnime.new(comment_anime_params)

    respond_to do |format|
      if @comment_anime.save
        format.html { redirect_to '/animes/'+session[:anime_id].to_s, notice: "Comment anime was successfully created." }
        format.json { render :show, status: :created, location: @comment_anime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment_anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_animes/1 or /comment_animes/1.json
  def update
    respond_to do |format|
      if @comment_anime.update(comment_anime_params)
        format.html { redirect_to @comment_anime, notice: "Comment anime was successfully updated." }
        format.json { render :show, status: :ok, location: @comment_anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment_anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_animes/1 or /comment_animes/1.json
  def destroy
    @comment_anime.destroy
    respond_to do |format|
      format.html { redirect_to '/animes/'+session[:anime_id].to_s, notice: "Comment anime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_anime
      @comment_anime = CommentAnime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_anime_params
      params.require(:comment_anime).permit(:user_id, :anime_id, :msg)
    end
end
