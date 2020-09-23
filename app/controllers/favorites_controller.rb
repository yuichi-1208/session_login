class FavoritesController < ApplicationController

  def create
    # createの引数であるblog_idは、データベースのなかのカラム名のこと、favoritesのマイグレーションファイルを見ればわかる。
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    # favoritesテーブルには、id,user_id,blog_idのカラムが存在する。
    # favoritesテーブルのidカラムを対象に、送られてきて一致したidのレコードを削除する。
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
  end

end
