class StaticController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
    @name = params[:name]
  end
end
