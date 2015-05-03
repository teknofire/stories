class Page < ActiveRecord::Base
  belongs_to :chapter, touch: true

  attachment :image
end
