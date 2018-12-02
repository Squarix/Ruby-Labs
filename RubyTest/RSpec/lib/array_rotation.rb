class NewArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def rotate_arr(steps)
    begin
      raise 'Amount of steps can not be non-positive' if steps <= 0
      raise 'Array is empty' if @array.length == 0
    rescue Exception
      puts $ERROR_INFO.inspect
      return 'Error'
    end

    while steps > 0
      @array.unshift(@array.pop)
      steps -= 1
    end
    @array
  end

  def lookup
    if @array.length == 0
      return 'Error'
    end
    @array.each { |x| puts x; }
    return true
  end

  def get_array
    @array
  end
end

#array1 = NewArray.new([1, 2, 3, 4, 5])
#array1.lookup
#array1.rotate_arr(2)
#array1.lookup
