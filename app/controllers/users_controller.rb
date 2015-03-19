class UsersController < ApplicationController

  def bug_report


    render :bug_report

    # redirect_to beers_list_path
  end

  def submit
    @message = params[:bug_report][:message]
    BugMailer.bugs(@message).deliver_now
    render json: { message: 'Message Sent' }
  end
end
