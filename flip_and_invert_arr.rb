def flip_and_invert_image(image)
    return image unless image.any?
    n = image[0].size
    image.each do |arr|
        left = 0
        right = n -1

        while left <= right
            arr[left], arr[right] = arr[right] ^ 1, arr[left] ^1
            left += 1
            right -= 1
        end
    end
end
