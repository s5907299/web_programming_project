class Platform1sController < ApplicationController
  before_action :set_platform1, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /platform1s or /platform1s.json
  def index
    @platform1s = Platform1.all
  end

  # GET /platform1s/1 or /platform1s/1.json
  def show
    @anime_list = Anime.where(:id => Source0.where(platform1_id:params[:id]).pluck("anime_id"))
  end

  # GET /platform1s/new
  def new
    @platform1 = Platform1.new
  end

  # GET /platform1s/1/edit
  def edit
  end

  # POST /platform1s or /platform1s.json
  def create
    @platform1 = Platform1.new(platform1_params)

    respond_to do |format|
      if @platform1.save
        format.html { redirect_to @platform1, notice: "Platform was successfully created." }
        format.json { render :show, status: :created, location: @platform1 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @platform1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platform1s/1 or /platform1s/1.json
  def update
    respond_to do |format|
      if @platform1.update(platform1_params)
        format.html { redirect_to @platform1, notice: "Platform was successfully updated." }
        format.json { render :show, status: :ok, location: @platform1 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @platform1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platform1s/1 or /platform1s/1.json
  def destroy
    #@platform = Platform1.find_by(id:params[:id])
    @platform1.destroy
    respond_to do |format|
      format.html { redirect_to platform1s_url, notice: "Platform was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform1
      @platform1 = Platform1.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def platform1_params
      params.require(:platform1).permit(:name, :link)
    end
end
