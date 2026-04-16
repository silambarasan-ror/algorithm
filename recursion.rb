def permutation(str)
    @result = []
    recurssion(str, "")
    @result
end

def recursion(pending, completed)
    if pending.empty?
        @result << completed
        return
    end
    (0...(pending.length)).each do |i|
        recurssion(pending[0...i] + pending[(i+1)..] , completed + pending[i])
    end
end
p permutation("12345")
