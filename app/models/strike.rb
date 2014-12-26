# http://stackoverflow.com/questions/5496935/hash-instead-of-id
class Strike < ActiveRecord::Base
  validates :city,  presence: true
  validates :category, presence: true
  #calls the private method set_privatelink
  before_create :set_key

  #changes the url to use privatelink instead of the id
  #def to_param
    #privatelink
  #end

  private

  #generates a unique hash looking something like this: c24bea1693d9e56a1878cb83f252fba05532d9d0
  def set_key
    self.key = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
  
end
