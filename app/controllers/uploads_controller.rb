class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  authorize_resource
  
  def index
    @uploads = user_uploads
    @upload = current_user.uploads.build
  end

  def new
    @upload = current_user.uploads.build
  end

  def create
    @upload = current_user.uploads.build(upload_params)

    respond_to do |format|
      if @upload.save
        @upload.queue_process
        format.html { redirect_to @upload, notice: 'Zip was uploaded successfully. Please wait while we process your files' }
        format.json { render :show, status: :created, location: @upload }
      else
        @uploads = user_uploads
        format.html { render :index }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
  end

  def destroy
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_path, notice: 'Upload has been deleted' }
    end
  end

  private
    def user_uploads
      return unless signed_in?
      current_user.uploads
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = current_user.uploads.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:file)
    end
end
