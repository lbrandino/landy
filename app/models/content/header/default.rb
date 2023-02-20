class Content::Header::Default < Content::Base
  def generate
    @content.components.tap do |c|
      c.create!(element: image)
      c.create!(element: button)
    end
  end

  def partial = "contents/header/default"

  def options
    {
      display: "flex",
      direction: "flex-row",
      background: @content.page.defaults["colors"]["base"],
      width: "w-full",
      ml: "ml-auto",
      mr: "mr-auto",
      pt: "p-2",
      justify: "justify-between",
      items: "items-center"
    }
  end

  private

  def image
    options = {
      width: "w-16",
      height: "h-16"
    }

    Element::Image.new(src: DEFAULTS[:src], options: options)
  end

  def button
    options = {
      display: "flex",
      p: "px-8 py-2",
      background: @content.page.defaults["colors"]["primary"],
      color: @content.page.defaults["colors"]["primary_content"],
      items: "items-center"
    }

    Element::Button.create!(label: DEFAULTS[:label], href: DEFAULTS[:href], options: options)
  end
end