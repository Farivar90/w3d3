
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

arr = [1,[2],3]
new_arr = arr.deep_dup
new_arr[1] << 4
p arr
p new_arr