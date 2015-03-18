class UsersController < ApplicationController

  def bug_report

    render :bug_report

    # redirect_to beers_list_path
  end

  def submit
    BugMailer.bugs(params[:message]).deliver_now
    render json: { message: 'Message Sent' }
  end
end
