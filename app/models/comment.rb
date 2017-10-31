class Comment < ApplicationRecord
  validates :post, :author, :parent

  belongs_to :post

  belongs_to :author,
             class_name: :User,
             primary_key: :id,
             foreign_key: :user_id

  belongs_to :parent,
             class_name: :Comment,
             primary_key: :id,
             foreign_key: :parent_id,
             optional: true

  has_many :child_comments,
           class_name: :Comment,
           primary_key: :id,
           foreign_key: :parent_id,
           optional: true
end
