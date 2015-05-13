class Chapter < ActiveRecord::Base
  belongs_to :book, touch: true
  belongs_to :upload, touch: true
  has_many :pages, dependent: :destroy

  attachment :story

  acts_as_list scope: :book

  extend FriendlyId
  friendly_id :title, use: :slugged

  before_save :unassign_upload

  def should_generate_new_friendly_id?
    !slug? || title_changed?
  end

  def unassign_upload
    self.upload_id = nil unless book.nil?
  end

  def to_s
    !title.blank? ? title : story_filename
  end

  def story_xml
    @story_xml ||= Nokogiri::XML(story.read)
  end

  def import_pages
    count = 0
    pages.update_all(seen: false)

    cdata = chapter_data(story_xml.xpath('//Album').first)
    update_attributes(cdata)

    story_xml.xpath('//Entry').each do |entry|
      data = page_data(entry)
      page = pages.where(image_filename: data[:image_filename]).first_or_initialize
      page.title = data[:title]
      page.content = data[:content]
      page.sequence = count
      if File.exists?(data[:image_filename])
        page.image = File.open(data[:image_filename], 'rb')
        page.image.read
      end
      page.seen = true
      page.save
      count += 1
    end

    pages.where(seen: false).destroy_all
  end

  def chapter_data(node)
    {
      title: node_data(node, 'Title').first
    }
  end

  def page_data(node)
    {
      title: node_data(node, 'Title').first,
      image_filename: node_data(node, 'Snapshot').first,
      content: node_data(node, 'Text').first
    }
  end

  def node_data(node, selector)
    data = node.css(selector)
    case data.class.to_s
    when 'Element'
      data.content.first
    when 'Nokogiri::XML::NodeSet'
      data.children.map(&:content)
    else
      logger.info "Unknown node type: " + data.class.to_s
    end
  end
end
