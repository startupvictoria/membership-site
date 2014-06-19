class DashboardsController < ApplicationController
  before_filter :assert_authenticated

  def index
    render :welcome
  end

  def membership
  end

  def welcome
  end
end
