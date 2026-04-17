#ruby basics

### 1. MAP (Transformation)
# Array: Returns a new array
p [1, 2, 3].map { |n| n * 10 } 
# => [10, 20, 30]

# Hash: WARNING - Always returns an Array, not a Hash
p({ a: 1, b: 2 }.map { |k, v| v * 10 }) 
# => [10, 20]


### 2. SELECT (Filtering "In")
# Array: Returns matching elements
p [1, 2, 3, 4].select { |n| n.even? } 
# => [2, 4]

# Hash: Returns matching key-value pairs as a Hash
p({ a: 10, b: 5, c: 20 }.select { |k, v| v > 8 }) 
# => {:a=>10, :c=>20}


### 3. REJECT (Filtering "Out")
# Array: Returns elements that don't match
p [1, 2, 3, 4].reject { |n| n.even? } 
# => [1, 3]

# Hash: Returns pairs that don't match as a Hash
p({ a: 10, b: 5 }.reject { |k, v| v > 8 }) 
# => {:b=>5}


### 4. REDUCE (Accumulation)
# Array: Combines elements into one value
p [10, 20, 30].reduce(0) { |sum, n| sum + n } 
# => 60

# Hash: Uses destructuring |sum, (k, v)| to access values
p({ a: 10, b: 20 }.reduce(0) { |sum, (k, v)| sum + v }) 
# => 30


### 5. GROUP_BY (Categorization)
# Array: Groups elements into a Hash
p ["apple", "pear", "banana"].group_by { |word| word.length } 
# => {5=>["apple", "pear"], 6=>["banana"]}

# Hash: Groups key-value pairs into a Hash of Arrays
p({ math: 90, art: 50 }.group_by { |k, v| v >= 60 ? "Pass" : "Fail" }) 
# => {"Pass"=>[[:math, 90]], "Fail"=>[[:art, 50]]}


### 6. BONUS: TRANSFORM_VALUES (The Senior Choice)
# Use this when you want to map a Hash and KEEP it as a Hash
p({ a: 1, b: 2 }.transform_values { |v| v * 100 }) 
# => {:a=>100, :b=>200}
