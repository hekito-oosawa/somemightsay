class ToppagesController < ApplicationController
  def index
    if logged_in?
      @say = current_user.says.build # form_for 用
      #@says = current_user.says.order('created_at DESC').page(params[:page])
      @says = Say.all.order('created_at DESC').page(params[:page]).per(30)
    end
  end
end
