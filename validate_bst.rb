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
# @return {Boolean}
def is_valid_bst(root)
    validate_bst(root, -Float::INFINITY, Float::INFINITY)
end

def validate_bst(node, min, max)
    return true if node.nil? 
    return false if node.val >= max || node.val <= min
    validate_bst(node.left, min, node.val) &&
    validate_bst(node.right, node.val, max)
end
