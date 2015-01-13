class Admin < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :age
  attr_accessor :password

  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :first_name, minimum: 3, allow_blank: true
  validates_length_of :last_name, minimum: 3, allow_blank: true
  validates_numericality_of :age, only_integer: true, greater_than: 10, allow_blank: true

  def self.authenticate(email, password)
    admin  = find_by_email(email)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password, admin.password_salt)
      admin
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end