class Image 
  attr_accessor :image_data
  
  def initialize(image_data)
    @image_data = image_data
  end

  def get_ones
    ones = []
    @image_data.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end
    ones
  end

  def output_image
    @image_data.each do |arr|
      puts arr.join
    end
  end

def blur
  get_ones.each do |row_index, column_index|
    if row_index != 0 
     # top neigbor
    @image_data[row_index-1][column_index] = 1
   end
    if row_index != @image_data.length - 1 
     #bottom Neigbor
     @image_data[row_index+1][column_index] = 1
   end
    if column_index != 0 
     #left Neigbhor
     @image_data[row_index][column_index-1] = 1
   end
    if column_index != @image_data[row_index].length - 1
      # right nieghbor
     @image_data[row_index][column_index+1] = 1
    end  
  end

  
  # def blur!(distance=1)
  #  distance.times do
   #   blur_coords!
  #  end
 # end

end
=begin
def blur
  #copy = Image.new(@image_data)  this is a shallow copy
  copy = Image.new Marshal.load( Marshal.dump(@image_data) )
  (0...@image_data.length).each do |row_index|
    (0...@image_data[row_index].length).each do |column_index|
      if @image_data[row_index][column_index] == 1
        if row_index != 0 
         # top neigbor
         copy.image_data[row_index-1][column_index] = 1
       end
        if row_index != @image_data.length - 1 
         #bottom Neigbor
         copy.image_data[row_index+1][column_index] = 1
       end
        if column_index != 0 
         #left Neigbhor
         copy.image_data[row_index][column_index-1] = 1
       end
        if column_index != @image_data[row_index].length - 1
          # right nieghbor
         copy.image_data[row_index][column_index+1] = 1
        end  
      end
    end
  end
  @image_data = copy.image_data  
  
  # def blur!(distance=1)
  #  distance.times do
   #   blur_coords!
  #  end
 # end

end
=end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
]) 
image.blur
image.output_image



