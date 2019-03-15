class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :timeoutable, :lockable,
         authentication_keys: [:login]
  attr_writer :login

  def login
    @login || self.phonenumber
  end
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["phonenumber = :value", { :value => login }]).first
    elsif conditions.has_key?(:phonenumber)
      if conditions[:phonenumber].nil?
        where(conditions).first
      else
        where(phonenumber: conditions[:phonenumber]).first
      end
    end
  end
  def email_required?
    false
  end

  def email_changed?
    false
  end
  validates :phonenumber, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, :presence => false, :email => false
end
