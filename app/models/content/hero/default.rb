class Content::Hero::Default < Content::Base
  def generate
    @content.components.tap do |c|
      c.create!(element: h1)
      c.create!(element: h2)
      c.create!(element: button)
    end
  end

  def partial = "contents/hero/default"

  def options
    {
      display: "flex",
      direction: "flex-col",
      background: @content.page.defaults["colors"]["base"],
      width: "w-full",
      ml: "ml-auto",
      mr: "mr-auto",
      pl: "px-2",
      pt: "py-16",
      maxwidth: "max-w-7xl",
      justify: "justify-start",
      items: "items-start",
      gap: "gap-2"
    }
  end

  private

  def h1
    options = {
      size: "text-xl",
      color: @content.page.defaults["colors"]["primary_content"],
      font: "font-bold"
    }

    Element::H1.create!(title: DEFAULTS[:h1], options: options)
  end

  def h2
    options = {
      size: "text-lg",
      color: @content.page.defaults["colors"]["base_content"],
      font: "font-semibold"
    }

    Element::H2.create!(title: DEFAULTS[:h2], options: options)
  end

  def button
    options = {
      pl: "px-8",
      pt: "py-5",
      background: @content.page.defaults["colors"]["primary"],
      color: @content.page.defaults["colors"]["primary_content"]
    }

    Element::Button.create!(label: DEFAULTS[:label], href: DEFAULTS[:href], options: options)
  end
end