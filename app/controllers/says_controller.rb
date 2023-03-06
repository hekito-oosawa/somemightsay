class SaysController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @say = current_user.says.build(say_params)
    if @say.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @says = current_user.says.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @say.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def say_params
    params.require(:say).permit(:content)
  end
  
  def correct_user
    @say = current_user.says.find_by(id: params[:id])
    unless @say
      redirect_to root_url
    end
  end
end
