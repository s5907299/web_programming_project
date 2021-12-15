class MainController < ApplicationController
    include Concern

    before_action :has_session, except: %i[login register login_submit register_submit]
    #before_action :authenticate, except [:demo_login, :demo_show]\
  def main
    redirect_to '/home'
  end

  def home
    session[:name] = "Admin"
    @animes = Anime.all
    @news = AnimeNews.all
    @like_animes = LikeAnime.all
    @follows_animes = Follow.all
    @list_animes = MyList.all
    @like_news = LikeNews.all
    session[:path] = '/home'
  end
  def feed
    @animes = Anime.where(:id => Follow.where(user_id:@user.id).pluck("anime_id"))
    @news = AnimeNews.all
    session[:path] = '/feed'
  end
  def my_list
    @animes = Anime.where(:id => MyList.where(user_id:@user.id).pluck("anime_id"))
    session[:path] = '/my_list'
  end
  def anime
  end
  def news
  end
  def platform
  end

  def has_session
    if(session[:user_id])
      @user=User.find(session[:user_id])
    else
      redirect_to '/login', alert: "Please login with valid user."
    end
  end

  def login
    session.delete(:user_id)
    if(!@user) 
      @user=User.new
    end
  end

  def login_submit
    @email= params[:user][:email]
    @password= params[:user][:password]

    @user = User.find_by(email:@email)

    respond_to do |format|
      if @user && @user.authenticate(@password)
        session[:user_id] = @user.id
        format.html { redirect_to '/home', notice: "Login success" }
        format.json { render json: @user }
      else
        session.delete(:user_id)
        format.html { redirect_to login_path,alert: "Login fail" }
        format.json { render json: @user.errors,status: :unprocessable_entity}
      end
    end
 
  end

  def logout
    respond_to do |format|
      session[:user_id] = nil
      format.html { redirect_to login_path, notice: "User logout successfully." }
    
    end
  end

  def register
      @user=User.new
  end

  def register_submit
      @user = User.new(user_params)    

      respond_to do |format|
        if @user.save
          format.html { redirect_to login_path, notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :register , status: :unprocessable_entity  }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
  end

  def like_anime
    @anime = Anime.find_by(id:params[:anime_id])
    puts params[:path]
    respond_to do |format|
      if(@anime == nil)
        format.html { redirect_to '/home', notice: "Anime not found." }
      else
        if LikeAnime.find_by(user_id:@user.id,anime_id:@anime.id)
          LikeAnime.find_by(user_id:@user.id,anime_id:@anime.id).destroy
        else
          @like = LikeAnime.new(user_id:@user.id,anime_id:@anime.id)
          @like.save()
        end
        format.html { redirect_to session[:path]}
      end
    end
  end

  def follow_anime
    @anime = Anime.find(params[:anime_id])
    respond_to do |format|
      if(@anime == nil)
        format.html { redirect_to '/home', notice: "Anime not found." }
      else
        if Follow.find_by(user_id:@user.id,anime_id:@anime.id)
          Follow.find_by(user_id:@user.id,anime_id:@anime.id).destroy
        else
          @follow = Follow.new(user_id:@user.id,anime_id:@anime.id)
          @follow.save()
        end
        format.html { redirect_to session[:path]}
      end
    end
  end

  def like_news
    @news = AnimeNews.find_by(id:params[:anime_news_id])
    respond_to do |format|
      if(@news == nil)
        format.html { redirect_to '/home', notice: "News not found." }
      else
        if LikeNews.find_by(user_id:@user.id,anime_news_id:@news.id)
          LikeNews.find_by(user_id:@user.id,anime_news_id:@news.id).destroy
        else
          @like = LikeNews.new(user_id:@user.id,anime_news_id:@news.id)
          @like.save()
        end
        format.html { redirect_to session[:path]}
      end
    end
  end

  def add_to_list
    @anime = Anime.find(params[:anime_id])
    respond_to do |format|
      if(@anime == nil)
        format.html { redirect_to '/home', notice: "Anime not found." }
      else
        if MyList.find_by(user_id:@user.id,anime_id:@anime.id)
          MyList.find_by(user_id:@user.id,anime_id:@anime.id).destroy
        else
          @myList = MyList.new(user_id:@user.id,anime_id:@anime.id)
          @myList.save()
        end
        format.html { redirect_to session[:path]}
      end
    end
  end
  def platform
    @platforms = Platform1.all
  end

end