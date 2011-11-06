

class Fortune < ActiveRecord::Base 
has_many :comments, :dependent => :destroy
 attr_accessible :author, :body 
 validates :body, :presence => true 
 validates_length_of :body, :in => 2..128 
 validates_uniqueness_of :body, :case_sensitive => false 
validates_length_of :author, :in => 4..64, :allow_blank => true
 
   belongs_to :user
  has_many :comments, :dependent => :destroy



def self.search(search)
		if search
			where('body LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
 end

