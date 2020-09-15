class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

 

# follower_idフォローされているユーザー、followingフォローしているユーザー
  # userはfollowing_relationshipsを通して、多くのfollowing_idを持っている。フォローしているユーザー特定
  # following_relationships（名前なんでもいい）, foreign_key: "値"（外部キー必ず"値"が存在する）, class_name: "モデル"（モデル指定）, dependent: :destroy（中間テーブルありで削除可にする）
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  # userは多くのfollowing_idを持っている
  has_many :followings, through: :following_relationships
 
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  # def following?(other_user)
  #   following.include?(other_user)
  # end
 
  # ユーザーをフォロー, 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end
  # ユーザーをアンフォロー
  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end
  # 現在のユーザーがフォローしたらtrueを返す
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

end
