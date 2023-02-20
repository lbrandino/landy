class Element::H2 < ApplicationRecord
  has_one :component, as: :element
end
