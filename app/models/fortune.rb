

class Fortune < ActiveRecord::Base 
 attr_accessible :author, :body 
 validates :body, :presence => true 
 validates_length_of :body, :in => 2..128 
 validates_uniqueness_of :body, :case_sensitive => false 
validates_length_of :author, :in => 4..64, :allow_blank => true



def self.search(search)
		if search
			where('body LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
 end

