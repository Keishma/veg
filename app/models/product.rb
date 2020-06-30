class Product < ApplicationRecord
	has_many :prices
	has_many :shops,  through:  :prices
	validates :title, :brand, :quantity, presence: true
	has_one_attached :image
	# This method associates the attribute ":avatar" with a file attachment
	has_attached_file :photo, styles: {
	thumb: '100x100>',
	square: '200x200#',
	medium: '300x300>'
	}

	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	def full_title
		(brand + ' ' + title).split.map(&:capitalize)*' '
	end

	def image_url(size)
		the_url = photo.url(size).to_str
		part_one = the_url.split('?')[0]
		part_two = part_one.split('veggie-assets/')[1]
		return 'https://veggie-assets.s3.us-east-2.amazonaws.com/'+part_two
	end

	def self.search(search)
  		where("title LIKE ? OR brand LIKE ?", "%#{search}%", "%#{search}%")
	end



end
 