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

def blur
  copy = Image.new(@image_data)
  (0..@image_data.length).each do |row_index|
    (0..@image_data[row_index].length).each do |column_index|
      if @image_data[row_index][column_index] == 1
        if row_index != 0 
         # to neigbor
         copy.image_data[row_index-1][column_index] = 1
        
         #bottom Neigbor
         copy.image_data[row_index+1][column_index] = 1
        
         #left Neigbhor
         copy.image_data[row_index][column_index-1] = 1
        
         copy.image_data[row_index][column_index+1] = 1
        end  
      end
    end
  end
  @image_data = copy.image_data  

end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
]) 
image.blur
image.output_image

