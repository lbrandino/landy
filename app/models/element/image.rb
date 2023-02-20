class Element::Image < ApplicationRecord
  has_one :component, as: :element
end
