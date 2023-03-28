# frozen_string_literal: true

class CategoryComponent < ViewComponent::Base
  

  def initialize(category: nil)
    @category = category
  end

  def title
    @category ? @category.name : t('.all')
  end

  def link
    @category ? products_path(category_id: @category.id) : products_path
  end

  def classes
    "category   text-gray-600   px-4 py-2 rounded-2xl  hover:bg-blue-200 #{background} "
  end

  def active?
    return true if !@category && !params[:category_id]
    @category&.id == params[:category_id].to_i
  end

  private
  def background
    active? ? "bg-blue-200" : "bg-orange-200"
  end

end
