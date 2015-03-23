class BeersController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create,
                                                           :add_comment,
                                                           :add_bar]

  def create
    @beer = Beer.new(beer_params)
    if @beer.save
      render json: { beer: @beer }, status: :created
    else
      render json: { messages: @beer.errors.full_messages },
                    status: :unprocessable_entity
    end
  end

  def show
    @beer = Beer.find(params[:id])
    render json: { beer: @beer,
                   bars: @beer.json_bars }
  end

  def search
    if params[:query]
      @beers = Beer.search(params[:query])
      render json: { beers: @beers }
    else
      render json: { message: "No query provided" }
    end
  end

  def add_comment
    @beer = Beer.find(params[:id])
    @comment = @beer.comments.create(comment_params)
    render json: { comment: @comment }
  end

  def comment
    @beer= Beer.find(params[:id])
    @comment = @beer.comments.all
    render json: { comments: @comment}
  end

  def list
    @beer = Beer.all
    render json: { beer: @beer}
  end

  def add_bar
    @beer = Beer.find(params[:id])
    @glass = @beer.glasses.create(glass_params)
    render json: { bars: @beer.bars}
  end

private
  def beer_params
    params.require(:beer).permit(:name,
                                 :flavor_profile1,
                                 :flavor_profile2,
                                 :flavor_profile3,
                                 :flavor_profile4,
                                 :flavor_profile5,
                                 :description,
                                 :kind,
                                 :brewery,
                                 :abv,
                                 :avatar)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def glass_params
    params.require(:glass).permit(:bar_id)
  end
end
