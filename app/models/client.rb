class Client < ApplicationRecord
  validates :first_name, :last_name, :phone, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :certs
  has_many :orders
  after_create :send_user_notification
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def send_user_notification
    ClientMailer.with(user: self).welcome.deliver_later
  end
end
