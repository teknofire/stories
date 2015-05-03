class Book < ActiveRecord::Base
  belongs_to :user
  has_many :chapters, ->{ order(position: :asc) }, dependent: :destroy
  has_many :uploads, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :for, ->(user) { where(user: user) unless user.nil? }
  scope :available, ->(user = nil) { user.nil? ? where(public: true) : where('user_id = ? or public = ?', user.id, true) }

  validates :title, presence: true

  def should_generate_new_friendly_id?
    !slug? || title_changed?
  end

  def self.ransackable_scopes(auth_object = nil)
    %i(available)
  end
end
