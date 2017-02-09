class Product < ActiveRecord::Base
  has_many :pics, dependent: :destroy

  has_attached_file :image, styles: { medium: "200x200", thumb: "200x200>", index: "350x300#", large: "700x700#"}, default_url: "/images/:style/logo.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  accepts_nested_attributes_for :pics, :reject_if => lambda { |t| t['pic'].nil? }

end
