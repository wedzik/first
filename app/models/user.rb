class User < ActiveRecord::Base
  include UserAuth
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :age, :position, :avatar
  attr_accessor :password
  mount_uploader :avatar, AvatarUploader
  self.per_page = 7

  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_length_of :first_name, minimum: 3, allow_blank: true
  validates_length_of :last_name, minimum: 3, allow_blank: true
  validates_numericality_of :age, only_integer: true, greater_than: 10, allow_blank: true


end
