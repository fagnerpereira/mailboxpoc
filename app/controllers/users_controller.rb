class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(params.require(:user).permit!)
    user.mailgun = "#{user.name.gsub(' ', '.').downcase}@sandbox4176cdb3671d4dbb824bdcf7a2691fb8.mailgun.org"

    if user.save!
      UsersMailer.instructions(user).deliver_now
      redirect_to user
    else
      render 'new'
    end
  end
end
