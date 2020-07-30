
  
    def my_each(array) 
        w = 0
        while w < array.size      
          yield(array[w]) 
          w += 1
        end
    end
    #  my_each([2,10,12,15]) {|e| print e + e}

    def my_each_with_index(array)
      w = 0
      while w < array.size
        yield(array[w], w)
        w += 1
      end
        array
   end
  #  my_each_with_index([2,10,12,15]) {|e, index| puts (e + e) if index.odd?}
  
  def my_select(array)
    second_array = []
    my_each(array) do |w|
      if yield (w)
        second_array.push(w)
      end
    end
    second_array
  end
  
  # puts my_select([1, 2, 3]){|x| x != 2}  

  def my_all?(array)
		my_each(array) do |w|
			if yield(w) == false
				return false
			end
		end
		true
  end
  # puts my_all?([1]){|x| x == 1 }
  # puts my_all?(["hello"]){|x| x == 1 }

  def my_any? (array)
    my_each(array) do |w|
      if yield(w) == true
        return true
      end
    end
    false
  end
  #  puts my_any?([1,2,3]) { |n| n > 0 }
  # puts my_any?([1,2,3]) { |n| n < 0 }

  def my_none?(array)
		my_each(array) do |w|
			if yield(w) == true
				return false
			end
		end
		true
  end

  # puts my_none?([1]){|x| x == 1 }
  # puts my_none?(["hello"]){|x| x == 1 }

  def my_count (array)
    my_select(array){|w| yield(w)}.size
  end
       
  #  puts my_count([1,2,3,4,8]) {|w| w%2 == 0} 

  def my_map (array, &block)
    second_array = []
    my_each(array) do |w|    
      second_array.push(block.call(w))
    end
    second_array
  end

  # puts my_map([1, 2, 3]){|x| x + 3}
  # puts my_map([1, 2, 3]){|x| x <= 3}

  def my_inject(array)
    my_each(self) do |w|
        array = yield(array, w)
    end
    array
end
  
  # puts [1,2,3,4].my_inject(0){|sum, num| sum + num} 

  def multiply_els(array)
    array.my_inject(1){|multipliyer, num| multipliyer * num}
  end 

# puts multiply_els([2,4,5]) 