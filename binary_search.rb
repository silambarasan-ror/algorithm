
def binary_search(arr, n)
    p recursive_search(arr, n, 0, arr.length - 1)
end

def recursive_search(arr, n, left, right)
    return -1 if left > right
    pivot = (left + right) / 2
    return pivot if arr[pivot] == n
    if arr[pivot] < n
        recursive_search(arr, n, pivot+1, right)
    else
        recursive_search(arr, n, left, pivot -1)
    end
end

binary_search([1,2,3,4,5], 5)

# iteration 1
# arr = [1,2,3,4,5]
# n = 5 left= 0 right = 4, pivot = 2
# arr[pivot] < n => 3 < 5

# iteration 2
# arr = [1,2,3,4,5]
# n = 5 left= 3 right = 4, pivot = 3
# arr[pivot] < n => 4 < 5

# iteration 3
# arr = [1,2,3,4,5]
# n = 5 left= 4 right = 4, pivot = 4
# arr[pivot] < n => 5 == 5 return pivot
