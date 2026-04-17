# Online Ruby Editor for free
# Write, Edit and Run your Ruby code using Ruby Online Compiler

# input = "hello world"
# output = "olleh dlrow"

def reverse_each_string(input)
    p input.split.map { |str| str.reverse }
end

reverse_each_string("hello world")

## word count

def word_cout(word)
    ha = Hash.new { |hash, key| hash[key] = 0 }

    word.each_char { |char|
        ha[char] += 1
    }
    ha
end

p word_cout('abinaya')