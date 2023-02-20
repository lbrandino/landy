class Element::H1 < ApplicationRecord
  has_one :component, as: :element
end
