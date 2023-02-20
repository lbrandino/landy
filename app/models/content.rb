class Content < ApplicationRecord
  belongs_to :page, dependent: :destroy
  has_many :components
  has_many :elements, through: :components

  before_create :set_options

  def generate
    content_instance.generate
  end

  def partial
    content_instance.partial
  end

  def content_instance
    @content_instance ||= content_kind.constantize.new(self)
  end

  private

  def set_options
    self.options = content_instance.options
  end
end
