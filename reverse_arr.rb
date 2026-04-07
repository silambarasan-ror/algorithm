def reverse_array(arr)
    right = arr.length - 1
    return arr if right <= 0
    left = 0
    while left < right
        arr[left],arr[right] = arr[right], arr[left] 
        right -= 1
        left += 1
    end
    arr
end

arr = [1,2,3,4,5]
p reverse_array(arr)
