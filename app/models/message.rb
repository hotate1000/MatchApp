class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  # イメージが空、コメントが空の場合保存出来ない
  validates :content, presence: true, unless: :image?
end
