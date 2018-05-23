class OptionsController < ApplicationController
  def index
    @review = Review.new
    @reviews = Review.all
  end
end
