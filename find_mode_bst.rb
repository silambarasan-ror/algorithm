# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def find_mode(root)
    @pre = nil
    @count = 0
    @max_count = 0
    @result = []
    traversal(root)
    @result
end

def traversal(node)
    return unless node
    
    traversal(node.left)

    if @pre == node.val
        @count += 1
    else
        @count = 1
    end
    
    if @count > @max_count
        @max_count = @count
        @result = [node.val]
    elsif @count == @max_count
        @result << node.val
    end

    @pre = node.val
    
    traversal(node.right)
end
