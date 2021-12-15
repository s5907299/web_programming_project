class Source0sController < ApplicationController
  before_action :set_source0, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end
  
  # GET /source0s or /source0s.json
  def index
    @source0s = Source0.all
  end

  # GET /source0s/1 or /source0s/1.json
  def show
  end

  # GET /source0s/new
  def new
    @anime = Anime.find_by(id: params[:anime_id])
    @source0 = Source0.new
    session[:anime_id] = @anime.id.to_s
    if not @anime
      respond_to do |format|
        format.html { redirect_to "/home", notice: "Don't have this anime" }
        format.json { render :show, status: :ok, location: @source0 }
      end
    end
  end

  # GET /source0s/1/edit
  def edit
  end

  # POST /source0s or /source0s.json
  def create
    @source0 = Source0.new(source0_params)
    respond_to do |format|
      
      if @source0.save
        format.html { redirect_to '/animes/'+session[:anime_id], notice: "Publish success." }
      else
        format.html { redirect_to '/publish/'+session[:anime_id], notice: "Publish not success."}
      end
      
    end
  end

  # PATCH/PUT /source0s/1 or /source0s/1.json
  def update
    respond_to do |format|
      if @source0.update(source0_params)
        format.html { redirect_to @source0, notice: "Source0 was successfully updated." }
        format.json { render :show, status: :ok, location: @source0 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source0.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source0s/1 or /source0s/1.json
  def destroy
    @source0.destroy
    respond_to do |format|
      format.html { redirect_to source0s_url, notice: "Source0 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source0
      @source0 = Source0.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def source0_params
      params.require(:source0).permit(:anime_id, :platform1_id, :desc)
    end
end
