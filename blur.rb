class Image 
  attr_accessor :image_data
  
  def initialize(image_data)
    @image_data = image_data
  end

  def output_image
    @image_data.each do |arr|
      puts arr.join
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
]) 
image.output_image

