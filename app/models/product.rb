class Product < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>", index: "350x300#", large: "1500x650#"}, default_url: "/images/:style/logo.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
