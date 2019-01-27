# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @item = Item.new
  end
end
