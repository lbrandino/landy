page = Page.create(
  name: "Julio Budal MVP"
)

header = Page::Section.create(
  page: page,
  content: create_content(type: Content::Header::Default)
)

hero = Page::Section.create(
  page: page,
  content: create_content(type: Content::Hero::Default)
)

page.sections.first.

class Page
  attr_accessor :name

  has_many :sections, polymorphic: true
end

class Page::Section
  belongs_to :page, as: :section
  belongs_to :content, polymorphic: true

  attr_accessor :order
end

class Content::Header::Default
  belongs_to :page_section
  has_many :elements, polymorphic: true

  def initilize
    @img = elements.create(type: Element::Img, src: "img")
    @cta = elements.create(type: Element::Button, label: "Purchase now", url: "https://example.com")
  end
end

class Content::Hero::Default
  has_many :elements, polymorphic: true

  def initilize
    @h1 = elements.create(type: Element::H1, title: "Default main engaging title")
    @h2 = elements.create(type: Element::H2, title: "Brief default description")
    @cta = elements.create(type: Element::Button, label: "Purchase now", url: "https://example.com")
  end
end

class Element::H1
  belongs_to :content, as: :element

  attr_accessoor :content
end

class Element::H2
  belongs_to :content, as: :element

  attr_accessoor :content
end

class Element::Cta
  belongs_to :content, as: :element

  attr_accessoor :content, :url
end

class Element::Img
  belongs_to :content, as: :element

  attr_accessoor :src
end