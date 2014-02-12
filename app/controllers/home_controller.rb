class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def inside
    @users = User.all
  end
end
