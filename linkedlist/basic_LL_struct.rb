# ==========================================
# NODE CLASS
# Represents a single element in the linked list
# ==========================================
class Node
  # attr_accessor allows us to read and write `@val` and `@next`
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val   # The data stored in the node
    @next = _next # Pointer/reference to the next node in the list
  end
end

# ==========================================
# LINKED LIST CLASS
# Manages a sequence of connected Nodes
# ==========================================
class LinkedList
  # Tracking both head (start) and tail (end) for efficient operations
  attr_accessor :head, :tail

  # Initialize the list with a starting value, creating the first node
  def initialize(val)
    node = Node.new(val)
    @head = node
    @tail = head
  end
  
  # Add one or more values to the end of the list ($O(1)$ time complexity per value using @tail)
  def add(*vals)
    vals.each do |val|
      new_node = Node.new(val)
      if @tail
        @tail.next = new_node # Link current tail to the new node
        @tail = @tail.next    # Update tail pointer to the new node
      else
        # If the list happened to be empty
        @head = new_node
        @tail = new_node
      end
    end
  end

  # Remove the last element (tail) from the list
  # Note: Requires traversing from head to find the second-to-last node ($O(N)$)
  def delete
    return if head.nil? # Do nothing if list is empty

    # If there is only one element in the list
    if @head == @tail
      @head = nil
      @tail = nil
      return
    end

    # Traverse until we find the node right before the tail
    node = @head
    while node.next != @tail
      node = node.next
    end
    
    node.next = nil # Cut off the old tail
    @tail = node    # Update tail pointer
  end

  # Returns an array of all values in the list sequentially (useful for printing)
  def display
    res = []
    node = @head
    while node
      res << node.val
      node = node.next
    end
    res
  end

  # Search if a specific value exists in the list (returns true/false)
  def search(val)
    node = @head
    while node
      return true if node.val == val
      node = node.next
    end
    false
  end
  
  # Insert a new node at the very beginning of the list ($O(1)$)
  def insert_first(val)
    node = Node.new(val)
    node.next = @head # Point new node to current head
    @head = node      # Update head to be the new node
    @tail = node unless @tail # Handle case if list was empty
  end

  # Delete all occurrences of a specific value from the list
  def delete_element(val)
    pre = nil
    cur = @head
    
    while cur
      if cur.val == val
        # If we are deleting the tail node, update the tail pointer to 'pre'
        @tail = pre if cur == @tail

        if cur == @head
          # If we are deleting the head node, shift head to the next node
          @head = @head.next
        else
          # Bypass the current node by linking previous to next
          pre.next = cur.next
        end
      else
        # Keep track of the previous node if we aren't deleting
        pre = cur
      end
      cur = cur.next
    end
  end
end

# ==========================================
# TESTING / DEMO USAGE
# ==========================================
l = LinkedList.new(1)
l.add(2, 3, 4)
p l.display       # Expected: [1, 2, 3, 4]
p l               # Inspects the object structure
l.insert_first(11)
p l.delete        # Deletes tail (4), returns if successful/prints state
p l.search(1)     # Expected: true
p l.add(1, 2, 3, 4, 5)

l.delete_element(3)
l.delete_element(1)
l.delete_element(4)
l.delete_element(2)
p l.display       # Final state display
