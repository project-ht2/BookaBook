 # create_table "authors", force: :cascade do |t|
 # 	t.string   "name"
 # 	t.string   "gender"
 # 	t.date     "birthday"
 # 	t.text     "description"
 # 	t.string   "image_url"
 # 	t.datetime "created_at",  null: false
 # 	t.datetime "updated_at",  null: false
 # end

class Author < ApplicationRecord
  has_many :books
  
  before_save do
    self.name_downcase = self.name.mb_chars.downcase.to_s
  end
end
