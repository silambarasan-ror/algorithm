def quick_sort(arr)
    p divide(arr)
end

def divide(arr)
    return arr if arr.length <= 1
    pivot = arr[-1]
    left = []
    right = []
    arr[0...-1].each do |ele|
        if ele <= pivot
            left << ele
        else
            right << ele
        end
    end
    l_val = divide(left)
    r_val = divide(right)
    merge(l_val, r_val, pivot)
end

def merge(left, right, pivot)
    result = left << pivot 
    result += right
    result
end

arr = [1,15, 11, 49, 2,9]
quick_sort(arr)
