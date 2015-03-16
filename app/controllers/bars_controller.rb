class BarsController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create, :add_comment]

# This allows a user to create a bar/store/restaurant, must have auth_token
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
    render json: { bar: @bar }
  end

  def add_comment
    @bar = Bar.find(params[:id])
    @comment = @bar.comments.create(comment_params)
    render json: { comment: @comment }
  end

  def list
    @bar = Bar.all
    render json: { bar: @bar }
  end

private
  def bar_params
    params.require(:bar).permit(:name,
                                :address)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
