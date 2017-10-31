# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
   validates :title, :subs, presence: true

  # has_one :sub
  has_many :post_subs
  #
  has_many :subs, through: :post_subs, source: :sub
  #
  #
  #
  #
  belongs_to :author,
             class_name: :User,
             primary_key: :id,
             foreign_key: :author_id
end
