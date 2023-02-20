class Content::Base
  DEFAULTS = {
    src: "https://upload.wikimedia.org/wikipedia/commons/2/2f/Logo_TV_2015.svg",
    href: "https://example.com",
    label: "Purchase now",
    h1: "Lorem ipsum dolor sit amet",
    h2: "Lorem ipsum dolor sit amet subtitle",
  }.freeze

  attr_reader :content

  def initialize content
    @content = content
  end
end