class Element::Button < ApplicationRecord
  has_one :component, as: :element
end
