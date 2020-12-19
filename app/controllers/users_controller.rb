class UsersController < ApplicationController
#ログインしていない状態での新規投稿画面接続のリダイレクト
  # before_action :move_to_index, exept: [:index, :show]

  def create
    User.create(user_params)
  end

  private
#ログインしていない状態での新規投稿画面接続のリダイレクト
  # def move_to_index
  #   unless user_signed_in?
  #   redirect_to action: :index
  # end
end


