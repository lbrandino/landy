module PagesHelper
  KEYS = %w(display direction background width height maxwidth justify items ml mr mt mb pl pr pt pb m p size color font gap)

  def classes_for element, extras=""
    (KEYS.map do |key|
      element.options.fetch(key, nil)
    end.join(" ") + extras).squish
  end
end
