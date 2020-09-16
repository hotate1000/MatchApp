class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader


# follower_idフォローされているユーザー、followingフォローしているユーザー
# userはfollowing_relationshipsを通して、多くのfollowing_idを持っている。フォローしているユーザー特定
# following_relationships（名前なんでもいい）, foreign_key: "値"（外部キー必ず"値"が存在する）, class_name: "モデル"（モデル指定）, dependent: :destroy（中間テーブルありで削除可にする）
# has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
# userは多くのfollowing_idを持っている
# has_many :followings, through: :following_relationships

# has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
# has_many :followers, through: :follower_relationships


  # followerフォローされる人、followingフォローする人
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

 
  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
