class Pic < ActiveRecord::Base
  belongs_to :product
  
  has_attached_file :image, styles: { medium: "200x200", thumb: "300x300", album: "600x600", big: "1000x1000"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
