class MailboxesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def messages
    user = User.find_by_mailgun!(params[:recipient])
    user.received = true
    user.save!
    render nothing: true, status: :ok
  rescue
    render nothing: true, status: :not_found
  end
end