class Page < ApplicationRecord
  has_many :contents

  before_create :set_defaults

  TEMPLATE = [
    Content::Header::Default,
    Content::Hero::Default,
    Content::Hero::Alternative
  ]

  def generate
    TEMPLATE.each do |template|
      contents.create(content_kind: template).generate
    end
  end

  private

  def set_defaults
    self.defaults = DEFAULT_OPTIONS
  end
end

DEFAULT_OPTIONS = {
  colors: {
    primary: "bg-yellow-500",
    primary_focus: "bg-yellow-600",
    primary_content: "text-gray-900",
    dark: "bg-purple-500",
    dark_focus: "bg-purple-600",
    dark_content: "text-white",
    base: "bg-white",
    base_content: "text-gray-900"
  },
  fonts: {
    h1: {
      family: "font-montserrat text-4xl",
      size: "4xl"
    },
    h2: {
      family: "font-montserrat text-3xl",
      size: "3xl"
    },
    p: {
      family: "font-lato text-lg",
      size: "lg"
    },
  }
}