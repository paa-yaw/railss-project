class Worker < ActiveRecord::Base
  has_and_belongs_to_many :requests 
  has_many :reviews, dependent: :destroy
  has_many :reports, dependent: :destroy

  mount_uploader :attachment, AttachmentUploader
  mount_uploader :photo, PhotoUploader
  

  validates :first_name, :last_name, :sex, :phone_number, :location, :experience,
  :minimum_wage, :status, presence: true 


  def engage
  	self.update(assigned: true)
  end

  def disengage
  	self.update(assigned: false)
  end
  
  def average_rating
    if reviews.any?
  	  reviews.sum(:rating) / reviews.size
    end
  end
end
