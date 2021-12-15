class MyListsController < ApplicationController
  before_action :set_my_list, only: %i[ show edit update destroy ]
  before_action :has_session
  
  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to login_path, alert: "Please login with valid user."
    end
  end

  # GET /my_lists or /my_lists.json
  def index
    @my_lists = MyList.all
  end

  # GET /my_lists/1 or /my_lists/1.json
  def show
  end

  # GET /my_lists/new
  def new
    @my_list = MyList.new
  end

  # GET /my_lists/1/edit
  def edit
  end

  # POST /my_lists or /my_lists.json
  def create
    @my_list = MyList.new(my_list_params)

    respond_to do |format|
      if @my_list.save
        format.html { redirect_to @my_list, notice: "My list was successfully created." }
        format.json { render :show, status: :created, location: @my_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_lists/1 or /my_lists/1.json
  def update
    respond_to do |format|
      if @my_list.update(my_list_params)
        format.html { redirect_to @my_list, notice: "My list was successfully updated." }
        format.json { render :show, status: :ok, location: @my_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_lists/1 or /my_lists/1.json
  def destroy
    @my_list.destroy
    respond_to do |format|
      format.html { redirect_to my_lists_url, notice: "My list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_list
      @my_list = MyList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_list_params
      params.require(:my_list).permit(:user_id, :anime_id)
    end
end
