#=header
class Recipe < ActiveRecord::Base
#==sub-header
#* list item #1
#* list item #2
  belongs_to :user
   #def initialize
   #  @name = 'N/A'
   #  @pic = 'N/A'
   #  @description = 'None'
   #  @rating = 0
   #  @ingredients = ['']
   #end
end
