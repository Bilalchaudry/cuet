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

  after_create do
    self.update(name: self.first_name+ " " + self.last_name)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "first_name", "last_name", "email", "phone", "created_at", "updated_at"]
  end

  # If associations are searchable, define them too
  # def self.ransackable_associations(auth_object = nil)
  #   ["associated_model_name"] # Replace with actual association names, if needed
  # end
  def self.ransackable_associations(auth_object = nil)
    ["certs", "orders"]
  end

end
