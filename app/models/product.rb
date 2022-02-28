class Product < ApplicationRecord
    belongs_to :category
    has_many_attached :images
    validates :code, presence: true
    validates :product_name, presence: true
    validates_uniqueness_of :product_name
    validates :category, presence: true
    validates :stock, presence: true
    validates :stock, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
    validate :image_type


    def image_type
        if images.attached? == false
            errors.add(:images, "Images must be added!")
        end
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
                errors.add(:images, 'Need to be a JPEG or PNG format')
            end
        end
    end

end
