class BarsController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create,
                                                           :add_comment,
                                                           :add_beer]

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      render json: { bar: @bar }, status: :created
    else
      render json: { messages: @bar.errors.full_messages },
                    status: :unprocessable_entity
    end
  end

  def search
    if params[:query]
      @bars = Bar.search(params[:query])
      render json: { bars: @bars}
    else
      render json: { message: "No query provided" }
    end
  end

  def show
    @bar = Bar.find(params[:id])
    render json: { bar: @bar, beers: @bar.json_beers }
  end

  def add_comment
    @bar = Bar.find(params[:id])
    @comment = @bar.comments.create(comment_params)
    render json: { comment: @comment }
  end

  def comment
    @bar= Bar.find(params[:id])
    @comment = @bar.comments.all
    render json: { comments: @comment}
  end

  def list
    @bar = Bar.all
    render json: { bar: @bar }
  end

  def add_beer
    @bar = Bar.find(params[:id])
    @glass = @bar.glasses.create(glass_params)
    render json: { bars: @bar.beers}
  end


private
  def bar_params
    params.require(:bar).permit(:name,
                                :address,
                                :description)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def glass_params
    params.require(:glass).permit(:beer_id, :bar_id)
  end
end
