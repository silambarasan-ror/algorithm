def  merge_sort(arr)
    len = arr.length
    divide(arr, len)
end
def divide(arr, n)
    return arr if n == 1
    div_len = n/2
    fa = arr[0..(div_len - 1)]
    la = arr[div_len ..]
    left =  divide(fa, fa.length)
    right =  divide(la, la.length)
    conquire(left, right)
end

def conquire(left, right)
    result = []
    i = 0
    j = 0
    l = left.length
    r = right.length
    
    while i < l && j < r 
        if left[i] < right[j]
            result << left[i]
            i+= 1
        else
            result << right[j]
            j += 1
        end
    end
    result += left[i..-1] if i < l
    result += right[j..-1] if j < r
    
    result
end

arr = [5,4,3,2,1,9]
p merge_sort(arr)
