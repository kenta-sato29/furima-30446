class User < ApplicationRecord
  has_many :items
  has_many :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    NAME_REGEX = /\A([ぁ-んァ-ン一-龥]|ー)+\z/.freeze
    KANA_REGEX = /\A([ァ-ン]|ー)+\z/.freeze
    validates :nickname
    validates_format_of :family_name, with: NAME_REGEX
    validates_format_of :first_name, with: NAME_REGEX
    validates_format_of :family_name_kana, with: KANA_REGEX
    validates_format_of :first_name_kana, with: KANA_REGEX
    validates :birthday
    validates :email
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
  end
end
