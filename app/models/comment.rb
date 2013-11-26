#=header
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  validates :content, length: { maximum: 300 }
#==sub-header
#1 list item #1
#2 list item #2
   #def initialize
   #  @owner = 'N/A'
   #  @comment = 'None' 
   #  @date = '2013-11-23'
   #  @rating = 0
   #end
end
