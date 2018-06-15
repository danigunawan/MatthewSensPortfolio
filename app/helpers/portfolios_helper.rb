module PortfoliosHelper
  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

# this method takes two arguements (img and type) then it says if img is provided (uploaded) return the image
# elseif type is thumb then use our image generator method from above
# else returns our main image
# then we call this from the view
  def portfolio_img img, type
    if img.is_a?(String)
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    else
      image_generator(height: '600', width: '400')
    end
  end
end
