class MailboxesController < ApplicationController

#  def create
#    data = Multimap.new
#    data[:priority] = 0
#    data[:description] = "Sample route"
#    data[:expression] = "match_recipient('.*@sandbox4176cdb3671d4dbb824bdcf7a2691fb8.mailgun.org')"
#    data[:action] = "forward('http://requestb.in/1eikb3f1')"
#    data[:action] = "stop()"
#    RestClient.post "https://api:key-dc38bf9d560402dc6e6e99012a6824fa"\
#    "@api.mailgun.net/v3/routes", data
#  end


  def messages
    user = User.find_by_mailgun!(params[:recipient])
    user.received = true
  rescue
  end
end