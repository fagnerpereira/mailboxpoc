class MailboxesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def messages
    email = params[:message][:headers][:to]
    user = User.find_by_mailgun!(email)
    user.received = true
    render nothing: true, status: :ok
  rescue
    render nothing: true, status: :not_found
  end
end