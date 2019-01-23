class Dish < ApplicationRecord
	has_many :ratings
	has_and_belongs_to_many :restaurants
	
	has_attached_file :image, styles: {
       thumb: '100x100>',
       square: '200x200#',
       medium: '350x350>',
       pdf_preview: '600x600>'}, processors: [:thumbnail]
 validates_attachment :image, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)},
 attachment_size: { less_than: 5.megabytes }
end
