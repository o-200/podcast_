class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :body, :audio)
  end
end
