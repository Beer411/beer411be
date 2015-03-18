class UsersController < ApplicationController

def bug_report
  message = params[:bugs][:message]
  BugMailer.bugs(user, message).deliver
  redirect_to beers_list_path
end

end
