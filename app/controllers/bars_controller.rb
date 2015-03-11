class BarsController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create]


  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      render json: { bar: @bar }, status: :created
    else
      render json: { messages: @bar.errors.full_messages },
                    status: :unprocessable_entity
    end
  end

  def show
    @bar = Bar.find(params[:id])
    render json: { bar: @bar }
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
end
