class ContentsController < ApplicationController
  def index
    @contents = Content.all.order(:created_at)
  end
end
