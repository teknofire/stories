class Page < ActiveRecord::Base
  belongs_to :chapter, touch: true
  has_one :book, through: :chapter
  has_one :upload, through: :chapter

  attachment :image
  acts_as_list column: :sequence, top_of_list: 0, scope: :chapter
end
