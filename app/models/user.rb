class User < ActiveRecord::Base
  has_many :authorizations, dependent: :destroy
  has_many :uploads
  has_many :books

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
