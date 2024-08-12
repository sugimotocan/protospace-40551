class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  # ここで取得したユーザーオブジェクトを@userに代入
    @name = @user.name             # @nameに代入する値も@userから取得
    @prototypes = @user.prototypes # プロトタイプも@userから取得
  end
end