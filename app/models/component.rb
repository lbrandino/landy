class Component < ApplicationRecord
  belongs_to :content
  belongs_to :element, polymorphic: true
end
