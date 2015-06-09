class Theme < ActiveRecord::Base
  validate :only_one_site
 
  def to_s
    title.blank? ? id : title
  end

  def only_one_site
    if self.site? and Theme.where(site: true).where.not(id: self.id).count > 0
      errors.add(:site, 'already set')
    end
  end
end
