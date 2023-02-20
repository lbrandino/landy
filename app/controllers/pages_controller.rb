class PagesController < ApplicationController
  def show
    @page = Page.includes(contents: [components: :element]).find(params[:id])
  end
end
