class Relationship < ApplicationRecord

  # class_name: "モデル"（モデル指定）
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"

# follower_idフォローされているユーザー、followingフォローしているユーザー
  # presenceから文字×
  validates :follower_id, presence: true
  validates :following_id, presence: true
end
