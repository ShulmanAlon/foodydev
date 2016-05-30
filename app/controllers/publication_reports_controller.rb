  class PublicationReportsController < ApplicationController
  before_action :set_publication_report, only: [:edit, :update, :destroy]
  after_action :pushReport, only: [:create]

  def index
    if(params.has_key?(:publication_id) && params.has_key?(:publication_version))
     render json: PublicationReport.where( publication_id: params[:publication_id], publication_version: params[:publication_version] )
    else 
      render json: PublicationReport.all
    end
      
  end

  def create
    @report = PublicationReport.new(publication_report_params)
    @report.save!
    if(@report.rating != 0)
      @rating = Rating.new()
      @rating.publication_id = @report.publication_id
      @rating.publication_version  = 1 #@report.publication_version
      @rating.rate = @report.rating
      @rating.publisher_user_id = 3 #Publication.find(@report.publication_id).publisher_id
      @rating.reporter_user_id  = 8 #@report.reporter_user_id
      @rating.save!
    end
    render json:  @report
  rescue
    render json: @report.errors, status: :unprocessable_entity 
  end

private
  
  def pushReport
    require ENV["push_path"]
    pub = Publication.find(@report.publication_id)
    push = Push.new(pub,@report)
    push.report
  rescue => e
    logger.warn "Unable to push, will ignore: #{e}"
  end

    # Use callbacks to share common setup or constraints between actions.
  def set_publication_report
    @publication_report = PublicationReport.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def publication_report_params
    params.require(:publication_report).permit(:publication_id, :publication_version, :report, :date_of_report, :active_device_dev_uuid ,:report_user_name ,:report_contact_info, :reporter_user_id, :rating)
  end
end
