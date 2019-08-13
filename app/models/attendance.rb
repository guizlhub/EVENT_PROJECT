
class Attendance < ApplicationRecord
	#after_create :confirmation_send

  belongs_to :participant, class_name: 'User'
  belongs_to :event

  private

  def confirmation_send
    AttendanceMailer.confirmation_email(self).deliver_now
  end
end