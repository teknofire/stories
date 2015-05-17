class User < ActiveRecord::Base
  has_many :authorizations, dependent: :destroy
  has_many :uploads
  has_many :books

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.create_from_hash!(hash)
    user = create(params_from_hash(hash))
    user
  end

  def self.params_from_hash(hash)
    info = {
      name: hash['info']['name'],
      email: hash['info']['email']
    }
    info.merge!({ avatar: hash['info']['image'] }) unless hash['info']['image'].blank?
    info
  end
end
