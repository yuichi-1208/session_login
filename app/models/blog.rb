class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  # has_many :favoritesと定義することで、favorites というメソッドにより、
  # Blogと一対多で紐づいているFavoriteモデルのレコードを全件取得できるようになります。
  has_many :favorites, dependent: :destroy
  # has_many :favorite_users, through: :favorites, source: :userと定義することで、
  # favorite_users というメソッドにより、 blogのidと一致するblog_idを持つfavoritesテーブルのレコードを全て取り出します。
  # その上で、そのfavoritesテーブルのレコードがもっているuser_idの数字と同じidを持つuserを全件取得できるようになります。
  # この時、through: :favoritesで「favoritesを通過して」、source: :userで「userの情報を取得する」という意味合いになります
  has_many :favorite_users, through: :favorites, source: :user
end
