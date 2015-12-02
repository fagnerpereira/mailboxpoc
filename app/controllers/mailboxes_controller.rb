class MailboxesController < ApplicationController

  def create
    data = Multimap.new
    data[:priority] = 0
    data[:description] = "Sample route"
    data[:expression] = "match_recipient('.*@sandbox4176cdb3671d4dbb824bdcf7a2691fb8.mailgun.org')"
    data[:action] = "forward('http://requestb.in/1eikb3f1')"
    data[:action] = "stop()"
    RestClient.post "https://api:key-dc38bf9d560402dc6e6e99012a6824fa"\
    "@api.mailgun.net/v3/routes", data
  end


  def messages(request)
    if request.method == 'POST':
         sender    = request.POST.get('sender')
         recipient = request.POST.get('recipient')
         subject   = request.POST.get('subject', '')

         body_plain = request.POST.get('body-plain', '')
         body_without_quotes = request.POST.get('stripped-text', '')
         # note: other MIME headers are also posted here...

         # attachments:
         for key in request.FILES:
             file = request.FILES[key]
             # do something with the file

     # Returned text is ignored but HTTP status code matters:
     # Mailgun wants to see 2xx, otherwise it will make another attempt in 5 minutes

     return HttpResponse('OK')
   end
end