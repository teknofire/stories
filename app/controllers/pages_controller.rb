class PagesController < ApplicationController
  before_action :set_page
  before_action :set_chapter

  authorize_resource

  def index
    @pages = @chapter.pages.order(sequence: :asc)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to chapter_pages_path(@page.chapter), notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def up
    @page.move_higher

    redirect_to chapter_pages_path(@page.chapter)
  end

  def down
    @page.move_lower

    redirect_to chapter_pages_path(@page.chapter)
  end
  def top
    @page.move_to_top

    redirect_to chapter_pages_path(@page.chapter)
  end

  def bottom
    @page.move_to_bottom

    redirect_to chapter_pages_path(@page.chapter)
  end

  protected

  def set_chapter
    @chapter = Chapter.friendly.find(params[:chapter_id]) if params[:chapter_id].present?
  end

  def set_page
    @page = Page.find(params[:id]) if params[:id].present?
  end

  def page_params
    params.require(:page).permit(:title, :content)
  end
end
