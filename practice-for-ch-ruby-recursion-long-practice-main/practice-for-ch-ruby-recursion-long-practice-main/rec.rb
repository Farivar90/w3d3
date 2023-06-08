
def range(start, last)
    return [] if start == last
    range(start,last-1) + [last-1]
end



def sum_iterative(arr)
    return 0 if arr.empty?
    arr.inject(&:+)
end

# p sum_iterative([])
# p sum_iterative([1])
# p sum_iterative([1,2,3])

def rec_sum(arr)
    return 0 if arr.empty?
    arr.last + rec_sum(arr[0...-1])
end

# p rec_sum([])
# p rec_sum([1])
# p rec_sum([1,2,3])

def exponent_v1(base, exp)
    return 1 if exp == 0
    exponent_v1(base, exp-1) * base
end

# p exponent_v1(3, 0) #= 1
# p exponent_v1(2, 3) #= 8
# p exponent_v1(1, 1) #= 1
# p exponent_v1(0, 0) #= 1
# p exponent_v1(0, 4) #= 0


def exponent_v2(base, exp)
    return 1 if exp == 0
    return base if exp == 1
    if exp.even?
        exponent_v2(base, exp/2) * exponent_v2(base, exp/2)
    else
        exponent_v2(base, (exp+1)/2) * exponent_v2(base, exp/2)
    end
end

# p exponent_v2(3, 0) #= 1
# p exponent_v2(2, 3) #= 8
# p exponent_v2(1, 1) #= 1
# p exponent_v2(0, 0) #= 1
# p exponent_v2(0, 4) #= 0

class Array
    def deep_dup
        return [] if self.empty?
        [self.first.dup] +  self[1..-1].deep_dup
    end
    
end

# arr = [1,[2],3]
# new_arr = arr.deep_dup
# new_arr[1] << 4
# p arr
# p new_arr

def fibonacci_it(n)
    return nil if n <= 0
    return 1 if n == 1 || n == 2
    fib = [1,1]
    i = 2
    while i < n
        fib[i] = fib[i - 1] + fib[i - 2]
        i += 1
    end
    fib[-1]
end

# # 1,1,2,3,5,8,13,21,34
# # 1 2 3 4 5 6  7  8  9
# p fibonacci_it(0)
# p fibonacci_it(-5)
# p fibonacci_it(1)
# p fibonacci_it(2)
# p fibonacci_it(3)
# p fibonacci_it(4)
# p fibonacci_it(5)
# p fibonacci_it(6)
# p fibonacci_it(60)


def fibonacci_rec(n)
    return nil if n <= 0
    return 1 if n == 1 || n == 2
    fibonacci_rec(n-2) + fibonacci_rec(n-1)
end

# # 1,1,2,3,5,8,13,21,34
# # 1 2 3 4 5 6  7  8  9
# p fibonacci_rec(-5)
# p fibonacci_rec(0)
# p fibonacci_rec(1)
# p fibonacci_rec(2)
# p fibonacci_rec(3)
# p fibonacci_rec(4)
# p fibonacci_rec(5)
# p fibonacci_rec(6)
# p fibonacci_rec(60)

def bsearch(array, target)
    return nil if !array.include?(target)

    middle = array.length/2 # for even, the later middle
    # index = 0

    if array[middle] == target
        return middle
    elsif array[middle] > target
        bsearch(array[0...middle], target)
    else
        1 + middle + bsearch(array[(middle+1)..-1], target)
    end

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil



def merge_sort(arr)
    new_arr = []
  return [] if arr.empty?
  return arr if arr.length == 1
  middle = arr.length/2
  left = arr[0...middle]
  right = arr[middle..-1]
 
  merge(merge_sort(left),merge_sort(right))

end

def merge(arr1,arr2)
    sorted = []

    while !(arr1.empty? || arr2.empty?)
        if arr1[0] < arr2[0]
            sorted << arr1[0]
            arr1.shift
        else
            sorted << arr2[0]
            arr2.shift
        end
    end
    if arr1.empty?
        return sorted + arr2
    end
    if arr2.empty?
        return sorted + arr1
    end
end

linear = *(0...100000)
arr = (linear).shuffle
puts merge_sort(arr)
