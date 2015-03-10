class BeersController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create]

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
    render json: { beer: @beer }
  end

  def list
    @beer = Beer.all
    render json: { beer: @beer }
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
                                 :abv)
  end
end
