# create_table "users", force: :cascade do |t|
#     t.string   "email",                  default: "", null: false
#     t.string   "encrypted_password",     default: "", null: false
#     t.string   "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.integer  "sign_in_count",          default: 0,  null: false
#     t.datetime "current_sign_in_at"
#     t.datetime "last_sign_in_at"
#     t.inet     "current_sign_in_ip"
#     t.inet     "last_sign_in_ip"
#     t.string   "name"
#     t.datetime "created_at",                          null: false
#     t.datetime "updated_at",                          null: false
#     t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
#   end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :shelves, class_name: "Shelf"
  has_many :book_items, :through => :shelves
  has_many :book_reviews
  has_many :transactions, class_name: "Transaction"

  has_many :following_relationship, foreign_key: "follower_id", class_name: "UserRelationship"
  has_many :follower_relationship, foreign_key: "following_id", class_name: "UserRelationship"
  has_many :followers, through: :follower_relationship
  has_many :followings, through: :following_relationship

  has_many :messages, class_name: "Message"
  has_many :transactions_reviews, foreign_key: 'reviewer_id', class_name: 'TransactionReview'
  has_many :received_transaction_reviews, foreign_key: 'target_id', class_name: 'TransactionReview'

  scope :all_except, -> (user) { where.not(id: user) }

  def avatar(height)
    if height
      if image_url
        image_url.sub("?type=large","?height=#{height}") || "background/musroom.jpg"
      else
        "background/musroom.jpg"
      end
    else
      image_url || "background/musroom.jpg"
    end
  end

  def self.search(search)
    if search
      search_downcase = search.mb_chars.downcase.to_s
      where(["name_downcase iLIKE ? OR lower(email) ILIKE ?", "%#{search_downcase}%", "%#{search_downcase}%"])
    else
      all
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.image_url = auth.info.image.sub("http:","https:") + "?type=large"
      user.name = auth.info.name   # assuming the user model has a name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  before_save do
    self.name_downcase = self.name.mb_chars.downcase.to_s
  end

  after_create do
    Shelf.create({
                     name: "Default",
                     description: "Default",
                     user: self
                 })
  end

  def already_review?(transaction_id)
    if self.transactions_reviews.find_by_transaction_id(transaction_id)
      return true
    else
      return false
    end
  end
end
