#=Recipe:
#* name
#* description
#* picture
#* ingredients
#* instructions

class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy #if recipe is deleted, then the comments are deleted
  validates :name, presence: true, length: { maximum: 50 }

   #class methods:
   def self.search(search_query)
     find(:all, :conditions => ['name LIKE ?', "%#{search_query}%"])
   end

   #instance methods:
   def average_rating
     av = 0
     n = 0
     self.comments.each do |comment|
       rating = comment.rating
       av = av + rating
       n = n + 1
     end
     av/n
   end

  #the feed:
  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end
end
