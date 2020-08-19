class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path, notice: 'ジャンルを追加しました'
    else
      @genres = Genre.all
      render :index
    end
  end


  def edit
    @genre = Genre.find(params[:id])
  end


  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to edit_admins_genre_path(@genre), notice: 'ジャンルを変更しました'
    else
      render :edit
    end
  end


  private
  
  def set_admin
    @admin = current_admin
  end

  def genre_params
    params.require(:genre).permit(:name, :is_active)
  end

end
