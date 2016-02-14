class PagesController < ApplicationController
  before_action :set_page

  authorize_resource

  def show
  end

  protected

  def set_page
    @page = Page.find(params[:id]) if params[:id].present?
  end
end
