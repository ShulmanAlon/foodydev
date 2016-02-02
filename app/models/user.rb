class User < ActiveRecord::Base
	  belongs_to :active_device
	  has_many :groups


	  validates :identity_provider_token, presence: true
      validates :phone_number, presence: true, length: { maximum: 9 }
      validates :identity_provider_email, presence: true
      validates :identity_provider_user_name, presence: true
      validates :active_device_dev_uuid, presence: true

      before_validation :normalize_phone


      def normalize_phone
      	self.phone_number = self.phone_number.gsub(/[^\d]/, '').split(//).last(9).join
      end

end
