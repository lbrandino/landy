class Section < ApplicationRecord
  belongs_to :page, dependent: :destroy
  has_one :content

  def generate
    content.generate
  end
end
