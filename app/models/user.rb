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
         
  has_many :shelves, class_name: 'Shelf'
  has_many :book_items
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
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
  
  after_create do
		Shelf.create({
		  name: 'Mặc định',
		  description: 'Mặc định',
		  user: self
		})
	end
end
