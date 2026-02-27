# === Blocks, Procs & Lambdas in Ruby ===
#
# ✅ Covered:
#   - Block syntax: { |x| ... } and do...end
#   - Built-in methods with blocks: .select, .map, chaining
#   - yield — calling a block from your own method
#   - Building your own .map with yield
#   - << for pushing to arrays
#
# ⏭ Next time:
#   - Procs — blocks saved to a variable (Proc.new, &block)
#   - Lambdas — like Procs but stricter (argument checking, return behavior)
#   - Passing Procs/Lambdas to methods
#
# A block is a chunk of code you pass to a method using { } or do...end
# Convention: { } for single-line, do...end for multi-line

# --- Exercise 1: Using blocks with built-in methods ---
# .select — filters elements where block returns true
# .map — transforms each element using the block
# Chain them together for a pipeline

array = [1, 5, 12, 3, 8, 20, 7]

p array.select { |num| num > 6 }
p array.map { |item| item * 2 }

puts "chained:"
p array.select { |num| num > 6 }.map { |item| item * 2 }

# Tip: 'p' prints the array as [24, 16, 40, 14]
# 'puts' prints each element on a new line

# --- Exercise 2: yield — calling a block from your own method ---
# yield(value) calls the block the caller passed in
# It returns whatever the block returns, so you can chain results

def apply_twice(number)
  result = yield(number)
  yield(result)
end

puts "apply_twice(3) { |n| n * 2 } => #{apply_twice(3) { |n| n * 2 }}"
# 3 → 6 → 12

# --- Exercise 3: Build your own .map using yield ---
# Loop over an array, yield each element, collect results into a new array
# << is idiomatic Ruby for pushing to an array (same as .push)

def transform_array(array)
  result_array = []
  array.each { |x| result_array << yield(x) }
  result_array
end

p transform_array([1, 2, 3]) { |n| n ** 2 }
# => [1, 4, 9]
