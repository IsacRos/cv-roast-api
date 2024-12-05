class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many_attached :cv
  has_many :roasts, dependent: :destroy
  validates :cv, content_type: ['application/pdf', 'image/jpeg', 'image/png'], size: { less_than: 5.megabytes }
end
