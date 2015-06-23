class PublicationsController < ApplicationController
  before_action :set_publication, only: [:update, :destroy]

  def index
    dti=(Time.now.utc).to_i
    render json: Publication.where( "is_on_air=? AND ending_date>=?", true, dti)
  end

  def create
		publication = Publication.new(publication_params)
    publication.save!
    render json: publication, only: [:id, :version]
    push(publication)
  rescue
    render json: publication.errors, status: :unprocessable_entity
  end

  def update
    @publication.update!(publication_params)
    render json: @publication, only: [:id, :version]
  rescue
    render json: @publication.errors, status: :unprocessable_entity
  end

  def destroy
    @publication.destroy
    render json: "OK"
  end

  def show
    @publication = Publication.find(params[:id])
    render json: @publication
  end

private
  def set_publication
    @publication = Publication.find(params[:id])
  end

  def push(publication)
    require houston
    @devices = ActiveDevice.where(is_ios: true).where.not(remote_notification_token: nil)
    certificate = File.read("/lib/assets/ck.pem")
    passphrase = “g334613334613fxct“
    connection = Houston::Connection.new(Houston::APPLE_DEVELOPMENT_GATEWAY_URI, certificate, passphrase)
    connection.open
    @devices.each do |device|
      notification = Houston::Notification.new(device: device.remote_notification_token) 
      notification.alert = “New Publication around you #{publication.title}“
      notification.badge = 1
      notification.sound = ""
      notification.category = “ARRIVED_CATEGORY“
      notification.content_available = false
      notification.custom_data = {’id’: publication.id, ’version’:publication.version ,’title’: publication.title}
      connection.write(notification.message)
    end
    connection.close
  end


  def publication_params
    params.require(:publication).permit(:version, :title, :subtitle, :address, :type_of_collecting, :latitude, :longitude, :starting_date, :ending_date, :contact_info, :is_on_air, :active_device_dev_uuid, :photo_url)
  end
end
